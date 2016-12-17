class Aspiration < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal, counter_cache: true
  belongs_to :group
  has_many :votes

  validates :user_id, presence: true
  validates :goal_id, presence: true

  scope :leaders, -> {
    order('votes_count DESC')
  }


  def self.markers_for_users(users, current_user = nil )
    users = users.reject{|user| user == current_user }
    markers = []
    users.each do |user|
      unless user.aspirations.leaders.empty?
        asp = user.aspirations.leaders.first
        markers.push({
                        lat: user.latitude,
                        lng: user.longitude,
                        usrId: user.id,
                        title: asp.goal.title,
                        details: asp.goal.details
                      })
      end
    end
    markers
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
