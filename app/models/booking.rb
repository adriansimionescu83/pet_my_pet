class Booking < ApplicationRecord
  STATUS = ['Submitted', 'Approved', 'Rejected', 'Completed']
  belongs_to :pet
  belongs_to :user
  # has_many :reviews, dependent: :destroy
end
