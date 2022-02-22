class AddSpeciesToPets < ActiveRecord::Migration[6.1]
  def change
    add_reference :pets, :species, foreign_key: true
  end
end
