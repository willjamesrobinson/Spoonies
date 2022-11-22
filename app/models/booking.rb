class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spooner
end
