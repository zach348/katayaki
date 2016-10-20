class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :aspiration

  validates :user_id, presence: true
  validates :aspiration_id, presence: true
end
