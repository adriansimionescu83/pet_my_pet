class AddNewUserColumnToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :user,  foreign_key: true
  end
end
