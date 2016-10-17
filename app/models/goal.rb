class Goal < ActiveRecord::Base
  has_many :users, through: :aspirations

  validates :title, presence: true, uniqueness: true, length: { in: 3..25 }
end
