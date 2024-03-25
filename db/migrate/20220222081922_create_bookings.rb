class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :pet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.integer :total_amount
      t.boolean :status

      t.timestamps
    end
  end
end
