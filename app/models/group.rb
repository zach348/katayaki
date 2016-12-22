class Group < ActiveRecord::Base
  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  has_many :affiliations
  has_many :users, through: :affiliations

  validates :name, presence: true, length: { in: 3..20 }, uniqueness: true
  validates :moderated, presence: true

  protected

  def clean_associations
    Affiliation.where(group_id: self.id).delete_all
  end
end
