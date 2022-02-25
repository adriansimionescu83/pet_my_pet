class ChangeDefaultStatusForBookings < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :status, 'Submitted'
  end
end
