class AddNameAgeGenderandSpoonTypetoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :first_name, :string
    add_column :users, :gender, :string
    add_column :users, :spoon_type, :string
  end
end
