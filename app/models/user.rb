class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader

  before_destroy :clean_associations

  has_many :affiliations
  has_many :aspirations
  has_many :goals, through: :aspirations
  has_many :groups, through: :affiliations
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def clean_associations
    Aspiration.where(user_id: self.id).delete_all
    Affiliation.where(user_id: self.id).delete_all
  end
end
