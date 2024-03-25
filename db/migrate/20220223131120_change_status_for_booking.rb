class ChangeStatusForBooking < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :status, :string
  end
end
