class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :date
      t.string :details
      t.references :user, null: false, foreign_key: true
      t.references :spooner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
