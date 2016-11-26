
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
    search = search.strip
    result = where('title ~* :regex', regex: "#{search}") + self.get_defs(search)
    result.sort{|a,b| a.title.match(/\A#{search}\z/) <=> b.title.match(/\A#{search}\z/) }
  end

  def self.get_defs(search)
    search.gsub!(/\s/, "+")
    uri = "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{search}?key=#{ENV['MW_DICT']}"
    response = Hash.from_xml(HTTParty.get(uri))
    self.goals_from_xml(response, search)
  end

  def self.goal_exists?(details)
    !where(details: details).empty?
  end

  protected

  def self.goals_from_xml(response, search)
    entries = []
    if response['entry_list']['entry']
      goals = entries.push(response['entry_list']['entry']).flatten.map do |entry|
        process_entry(entry, search)
      end
      goals.flatten.reject(&:nil?)
    else
      entries
    end
  end

  def self.process_entry(entry, search)
    if entry['ew'] && entry['def'] && entry['def']['dt']
      regex = /\A#{search.strip}\z/i
      title = entry['ew']
      defs = []
      defs.push(entry['def']['dt']).flatten!
      defs.map do |definition|
        title.match(regex).nil? ? nil : process_definition(definition, title)
      end
    else
      nil
    end
  end

  def self.process_definition(definition, title)
    definition.class != String ||
    definition.match(/[a-zA-Z]{3,}/).nil? ||
    goal_exists?(definition) ? nil : new(title: title.capitalize, details: definition)
  end
end
