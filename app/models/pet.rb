class Pet < ApplicationRecord
  GENDER = ['Male', 'Female']
  validates :name, presence: true
  validates :age, presence: true
  validates :description, presence: true
  validates :price_per_day, presence: true
  has_many :bookings
  belongs_to :breed
  belongs_to :species
  belongs_to :user
  has_many :reviews, through: :bookings
end
