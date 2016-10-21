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
      if !self.voted?(aspiration, user) then result.push(aspiration) end
    end
    result.shuffle.slice(0, num)
  end

  def self.to_hash(aspiration)
    {
      user: User.find(aspiration.user).full_name,
      goal: Goal.find(aspiration.goal).title,
      id: aspiration.id
    }
  end

  def self.voted?(aspiration, user)
    !Vote.where(user: user).where(aspiration: aspiration).empty?
  end
end
