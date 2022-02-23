class Booking < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
