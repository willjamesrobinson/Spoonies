require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
print "seeding started"

10.times do
  details = {
    name: Faker::Name.first_name,
    age: rand(18..50),
    spoon_type: ["big spoon", "little spoon", "any spoon"].sample,
    gender: ["male", "female"].sample,
    price: rand(2..100),
    overview: Faker::Lorem.paragraph
  }
  Spooner.create(details)
end

print "seeding complete"
