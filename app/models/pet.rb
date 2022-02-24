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
  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[name location],
    associated_against: {
      breed: [:name],
      species: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
  has_one_attached :photo, service: :cloudinary
end
