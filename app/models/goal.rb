class Goal < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true, length: { in: 3..25 }
end
