class AddDurationOnBookingsCorrection < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :duration, :integer
  end
end
