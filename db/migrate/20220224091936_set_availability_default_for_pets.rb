class SetAvailabilityDefaultForPets < ActiveRecord::Migration[6.1]
  def change
    change_column_default :pets, :is_available, from: false, to: true
  end
end
