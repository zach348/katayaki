class Goal < ActiveRecord::Base
  has_many :aspirations
  has_many :users, through: :aspirations

  validates :title, presence: true, uniqueness: true, length: { in: 3..25 }

  def self.top(num)
    ordered_goals = self.all.to_a.sort do |a,b|
      b.aspirations.count <=> a.aspirations.count
    end
    ordered_goals.slice(0, num)
  end
end
