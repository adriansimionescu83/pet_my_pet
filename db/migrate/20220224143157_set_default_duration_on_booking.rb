class SetDefaultDurationOnBooking < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :duration, 0
  end
end
