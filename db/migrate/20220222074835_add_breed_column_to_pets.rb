class AddBreedColumnToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :breed, index: true
  end
end
