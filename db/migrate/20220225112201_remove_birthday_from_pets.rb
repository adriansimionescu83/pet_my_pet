class RemoveBirthdayFromPets < ActiveRecord::Migration[6.1]
  def change
    remove_column :pets, :birthday, :date
  end
end
