
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
    search.gsub!(/\s/, "+")
    uri = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{search}?key=#{ENV['MW_DICT']}"
    response = Hash.from_xml(HTTParty.get(uri))
    entries = []
    if response['entry_list']['entry']
      entries.push(response['entry_list']['entry']).flatten.map do |entry|
        title = entry['ew']
        defs = []
        defs.push(entry['def']['dt']).flatten!
        { title: title, defs: defs }
      end
    else
      entries
    end
  end
end
