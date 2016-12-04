class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :aspiration, counter_cache: true

  validates :user_id, presence: true
  validates :aspiration_id, presence: true
end
