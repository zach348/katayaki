class Group < ActiveRecord::Base
  has_many :users, through: :affiliations

  validates :name, presence: true, length: { in: 3..20 }
  validates :moderated, presence: true
end
