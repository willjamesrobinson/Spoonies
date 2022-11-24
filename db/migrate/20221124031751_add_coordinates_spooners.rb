class AddCoordinatesSpooners < ActiveRecord::Migration[7.0]
  def change
    add_column :spooners, :latitude, :float
    add_column :spooners, :longitude, :float
    add_column :spooners, :address
  end
end
