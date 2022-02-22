class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.string :description
      t.string :location
      t.float :price_per_day
      t.boolean :is_available, default: false
      t.float :average_rating

      t.timestamps
    end
  end
end
