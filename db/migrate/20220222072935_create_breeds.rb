class CreateBreeds < ActiveRecord::Migration[6.1]
  def change
    create_table :breeds do |t|
      t.string :name
      t.references :species, foreign_key: true

      t.timestamps
    end
  end
end
