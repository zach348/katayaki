class Aspiration < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  belongs_to :group
  has_many :votes

  validates :user_id, presence: true
  validates :goal_id, presence: true

  def self.rate_items_for(user, num)
    aspirations = []
    groups = user.groups.pluck(:id)
    groups.each do |group_id|
      aspirations += self.where(group: group_id)
    end
    aspirations.shuffle.slice(0,10)
  end

  def self.to_hash(aspiration)
    {
      user: User.find(aspiration.user).full_name,
      title: Goal.find(aspiration.goal).title,
      description: Goal.find(aspiration.goal).description
    }
  end
end
