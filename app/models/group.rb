class Group < ActiveRecord::Base
  validates :name, presence: true, length: { in: 3..20 }
  validates :moderated, presence: true
end
