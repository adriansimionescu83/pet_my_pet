class ChangeAverageRatingTypeOnUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :average_rating, :float
  end
end
