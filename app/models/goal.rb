
class Goal < ActiveRecord::Base

  has_many :aspirations
  has_many :users, through: :aspirations
  validates :title, presence: true, length: { in: 3..25 }, uniqueness: { scope: [:details] }
  validates :details, presence: true, length: { in: 10..140 }

  def self.top(num)
    ordered_goals = self.all.to_a.sort do |a,b|
      b.aspirations.count <=> a.aspirations.count
    end
    ordered_goals.slice(0, num)
  end

  def self.search(search)
    where('title ILIKE ?', "%#{search}%") + self.get_defs(search)
  end

  def self.get_defs(search)
    response = Wordnik.word.get_definitions(search)
    response.map do |definition|
      Goal.new(title: search.capitalize, details: definition['text'])
    end
  end
end
