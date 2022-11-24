class AddUserToReviewAndSpooner < ActiveRecord::Migration[7.0]
  def change
    add_reference :spooners, :user, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
  end
end
