# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

species = Species.new(name: "Dog")
species.save
breed = Breed.new(name: "Golden retriever", species_id: species.id)
breed.save


pet = Pet.new(
  name:"Nice Dog",
  gender: "Male",
  age: 2,
  description: "Nice Dog, very playfull and good companion",
  price_per_day: 22.00,
  is_available: true,
  average_rating: 5,
  breed_id: breed.id
)
pet.save
