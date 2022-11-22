require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


10.times do
  details = {
    name: Faker::Superhero.name,
    age: rand(18..50),
    spoon_type: ["big spoon", "little spoon", "any spoon"].sample,
    gender: ["male", "female"].sample,
    price: rand(2..100),
    overview: Faker::Lorem.paragraph
  }
  spooner = Spooner.create(details)
  file1 = URI.open("https://source.unsplash.com/random/?person")
  spooner.img.attach(io: file1, filename: "#{spooner.name}1.jpg", content_type: "image/jpg")
  file2 = URI.open("https://source.unsplash.com/random/?person")
  spooner.img.attach(io: file2, filename: "#{spooner.name}2.jpg", content_type: "image/jpg")
  file3 = URI.open("https://source.unsplash.com/random/?person")
  spooner.img.attach(io: file3, filename: "#{spooner.name}3.jpg", content_type: "image/jpg")
  spooner.save
end
