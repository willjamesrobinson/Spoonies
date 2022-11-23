class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    SPOON_TYPE = ["big spoon", "little spoon", "any spoon"]
    GENDER = ["male", "female", "other"]
    validates :first_name, :spoon_type, :gender, presence: true
    validates :spoon_type, inclusion: { in: SPOON_TYPE }
    validates :gender, inclusion: { in: GENDER }
    has_many :bookings
    has_many :spooners, through: :bookings
end
