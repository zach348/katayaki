class Aspiration < ActiveRecord::Base
  belongs_to :user
  belongs_to :goal
  has_many :votes

  validates :user_id, presence: true
  validates :goal_id, presence: true
end
