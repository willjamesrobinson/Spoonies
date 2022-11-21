class Spooner < ApplicationRecord
  SPOON_TYPE = ["big spoon", "little spoon", "any spoon"]
  GENDER = ["male", "female", "other"]
  validates :name, :spoon_type, :price, presence: true
  validates :spoon_type, inclusion: { in: SPOON_TYPE }
  validates :gender, inclusion: { in: GENDER }
  validates :price, :age, numericality: { only_integer: true }
end
