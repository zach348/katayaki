class Aspiration < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  belongs_to :group
  has_many :votes

  validates :user_id, presence: true
  validates :goal_id, presence: true

  def self.rating_items_for(user, num)
    result = []
    aspirations = self.where(group: user.groups)
    aspirations.find_each do |aspiration|
      if !self.voted?(aspiration, user) && aspiration.user != user then result.push(aspiration) end
    end
    result.shuffle.slice(0, num)
  end

  def self.to_hash(aspiration)
    {
      user: User.find(aspiration.user).full_name,
      img_url: User.find(aspiration.user).avatar.url,
      goal: Goal.find(aspiration.goal).title,
      details: Goal.find(aspiration.goal).details,
      id: aspiration.id
    }
  end

  def self.voted?(aspiration, user)
    !Vote.where(user: user).where(aspiration: aspiration).empty?
  end

  def self.aspiration_exists?(goal, user, group)
    if self.where(goal: goal, user: user, group: group).empty?
      false
    else
      true
    end
  end
end
