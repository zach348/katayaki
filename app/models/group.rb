class Group < ActiveRecord::Base
  has_many :affiliations
  has_many :users, through: :affiliations

  validates :name, presence: true, length: { in: 3..20 }, uniqueness: true
  validates :moderated, presence: true

  protected

  def clean_associations
    Affiliation.where(group_id: self.id).delete_all
  end
end
