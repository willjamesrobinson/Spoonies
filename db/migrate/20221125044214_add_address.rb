class AddAddress < ActiveRecord::Migration[7.0]
  def change
    add_column :spooners, :address, :string
  end
end
