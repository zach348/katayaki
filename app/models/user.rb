class User < ApplicationRecord
  has_many :goals, through: :aspirations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, length: { in: 5..15 }, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
