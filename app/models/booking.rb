class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :spooners
  validates :details, length: { minimum: 50 }
end
