class Aspiration < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  belongs_to :group
  has_many :votes

  validates :user_id, presence: true
  validates :goal_id, presence: true

  def self.markers_in_bounds(bound1,bound2)
    binding.pry
    ##User.in_bounds...
  end

  def self.rating_items_for(user, num)
    result = []
    user_votes = user.votes.count
    aspirations = self.where(group: user.groups).where(id: self.pluck(:id).sample(user_votes + 10))
    aspirations.find_each do |aspiration|
      result.push(aspiration) unless aspiration.voted?(user) || aspiration.user == user
    end
    result.shuffle.slice(0, num)
  end

  def voted?(user)
    !self.votes.where(user: user).empty?
  end

  def self.aspiration_exists?(goal, user, group)
    if self.where(goal: goal, user: user, group: group).empty?
      false
    else
      true
    end
  end

  def to_hash
    {
      user: self.user.full_name,
      img_url: self.user.avatar.url,
      goal: self.goal.title,
      details: self.goal.details,
      id: self.id
    }
  end

end
