class Breed < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
  belongs_to :species, dependent: :destroy
end
