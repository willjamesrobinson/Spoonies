class Spooner < ApplicationRecord
  has_many_attached :img
  SPOON_TYPE = ["big spoon", "little spoon", "any spoon"]
  GENDER = ["male", "female", "other"]
  validates :name, :spoon_type, :price, :gender, :age, presence: true
  validates :spoon_type, inclusion: { in: SPOON_TYPE }
  validates :gender, inclusion: { in: GENDER }
  validates :price, :age, numericality: { only_integer: true }
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
end
