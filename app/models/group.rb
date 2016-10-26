class Group < ActiveRecord::Base
  has_many :affiliations
  has_many :users, through: :affiliations

  validates :name, presence: true, length: { in: 3..20 }, uniqueness: true
  validates :moderated, presence: true
end
