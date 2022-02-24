# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# --------------------------- Dogs ---------------------------

# dog = Species.create(name: "Dog")
# golden_retriever = Breed.create(name: "Golden Retriever", species_id: dog.id)
# bulldog = Breed.create(name: "Bulldog", species_id: dog.id)

# Pet.create(
#   name: "Cooper",
#   gender: "Male",
#   age: 2,
#   description: "Nice Dog, very playfull and good companion",
#   price_per_day: 22.00,
#   is_available: true,
#   average_rating: 5,
#   breed_id: golden_retriever.id
# )

# Pet.create(
#   name: "Maggie",
#   gender: "Female",
#   age: 3,
#   description: "Friendly and playful bulldog",
#   price_per_day: 25.00,
#   is_available: true,
#   average_rating: 4.7,
#   breed_id: bulldog.id
# )

# # --------------------------- Cats ---------------------------
# cat = Species.create(name: "Cat")
# persian = Breed.create(name: "Persian", species_id: cat.id)
# siamese = Breed.create(name: "Siamese", species_id: cat.id)

# Pet.create(
#   name: "Snowy",
#   gender: "Female",
#   age: 3,
#   description: "She is purrrrty sweet!",
#   price_per_day: 25.00,
#   is_available: true,
#   average_rating: 4.2,
#   breed_id: persian.id
# )

# Pet.create(
#   name: "Leo",
#   gender: "Male",
#   age: 5,
#   description: "Leo is very smart and beautiful",
#   price_per_day: 25.00,
#   is_available: true,
#   average_rating: 4.2,
#   breed_id: siamese.id
# )

# # --------------------------- Rabbits ---------------------------

# rabbit = Species.create(name: "Rabbit")
# cashmere_lop = Breed.create(name: "Cashmere Lop", species_id: rabbit.id)
# holland_lop = Breed.create(name: "Holland Lop", species_id: rabbit.id)

# Pet.create(
#   name: "Peter",
#   gender: "Male",
#   age: 4,
#   description: "He is so friendly and loves carrots!",
#   price_per_day: 15.00,
#   is_available: true,
#   average_rating: 4.9,
#   breed_id: cashmere_lop.id
# )

# Pet.create(
#   name: "Bugs Bunny",
#   gender: "Male",
#   age: 3,
#   description: "What's up doc? He is so funny!",
#   price_per_day: 18.00,
#   is_available: true,
#   average_rating: 5,
#   breed_id: holland_lop.id
# )

User.all.each do |user|
  if user.photo.key.nil?
    user.photo.key = 'prtuvxe5plh24afj3aibfg8gpvfl'
  end
end
Pet.all.each do |pet|
  if pet.photo.key.nil?
    pet.photo.key = 'prtuvxe5plh24afj3aibfg8gpvfl'
  end
end
