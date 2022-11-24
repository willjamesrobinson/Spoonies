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
  has_many :reviews, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating
    sum_ratings = reviews.reduce(0) { |sum, review| sum + review.rating }
    average = sum_ratings.fdiv(reviews.size)
    # round to nearest 0.5
    (average * 2.0).round / 2.0
  end

  def solid_stars
    average_rating.to_i
  end

  def half_stars
    remainder = average_rating % 1
    if remainder.zero?
      return 0
    else
      return 1
    end
  end

  def empty_stars
    5 - solid_stars - half_stars
  end
end
