class AddPendingtoBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :pending, :boolean, :default => true
  end
end
