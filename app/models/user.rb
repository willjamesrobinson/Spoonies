class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  SPOON_TYPE = ["big spoon", "little spoon", "any spoon"]
  GENDER = ["male", "female", "other"]
  validates :first_name, :spoon_type, :gender, :age, presence: true
  validates :spoon_type, inclusion: { in: SPOON_TYPE }
  validates :gender, inclusion: { in: GENDER }
  validates_numericality_of :age, only_integer: true
  has_many :bookings, dependent: :destroy
  has_many :spooners, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
