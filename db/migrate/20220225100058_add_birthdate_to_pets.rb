class AddBirthdateToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :birthdate, :date
  end
end
