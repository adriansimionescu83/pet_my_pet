class Species < ApplicationRecord
  validates :name, presence: true
  has_many :breeds
  has_many :pets
end
