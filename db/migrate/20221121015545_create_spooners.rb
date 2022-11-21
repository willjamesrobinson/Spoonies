class CreateSpooners < ActiveRecord::Migration[7.0]
  def change
    create_table :spooners do |t|
      t.string :name
      t.integer :age
      t.string :spoon_type
      t.string :gender
      t.integer :price
      t.text :overview

      t.timestamps
    end
  end
end
