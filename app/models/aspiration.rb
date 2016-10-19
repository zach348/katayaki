class Aspiration < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  belongs_to :group
  has_many :votes

  validates :user_id, presence: true
  validates :goal_id, presence: true

  def self.rating_items_for(user, num)
    aspirations = []
    groups = user.groups.pluck(:id)
    self.select do |aspiration|
      if groups.include?(aspiration.group_id) && self.voted?(aspiration, user)
        aspirations.push(aspiration)
      end
    end
  end

  def self.to_hash(aspiration)
    {
      user: User.find(aspiration.user).full_name,
      title: Goal.find(aspiration.goal).title,
      description: Goal.find(aspiration.goal).description,
      id: aspiration.id
    }
  end

  def self.voted?(aspiration, user)
    Vote.where(user: user).where(aspiration: aspiration).empty?
  end
end
