class AddImageToSpooner < ActiveRecord::Migration[7.0]
  def change
    add_column :spooners, :img, :string
  end
end
