require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "cleaning database"
Spooner.destroy_all
User.destroy_all
puts "seeding started"

Spooner.destroy_all

SPOONER_OVERVIEW = [
  "I'm ready to Netflix and spoon.",
  "Open to all spooning experiences",
  "My cat hates me so I'll spoon you instead.",
  "I'll be your spoon if you'll be mine.",
  "Only spoons accepted, no other cutlery need apply.",
  "As a spoon I'm the whole package, I'm basically a spork.",
  "Is a shovel just a garden spoon? Because I like to spoon outdoors ;)",
  "I'm a bit of a tease spoon.",
  "Tell all your friends about my spooning skills, it will cause quite a stir!",
  "Are you soup because I want to spoon you."
]

REVIEW_CONTENT = [
  { rating: 5, content: "Was happy to spoon me while I watched Titanic and cried" },
  { rating: 4, content: "Provided snacks" },
  { rating: 5, content: "Booked this spooner for me and a friend, had a great time" },
  { rating: 5, content: "This spooner saved my marriage" },
  { rating: 1, content: "This was the worst spoon I've ever had" },
  { rating: 2, content: "Subpar" },
  { rating: 5, content: "Excellent spooning, would spoon again" },
  { rating: 4, content: "Great" },
  { rating: 3, content: "Mediocre spooning at best" },
  { rating: 4, content: "Not bad" },
  { rating: 5, content: "Best spooner ever" },
  { rating: 5, content: "Repeat customer, would recommend" },
  { rating: 2, content: "They would only spoon out on the lawn..." },
  { rating: 4, content: "Unique spooning experience" },
  { rating: 1, content: "This is not what I paid for" },
  { rating: 1, content: "Rip-off" },
  { rating: 5, content: "This spooner's worth the hype" },
  { rating: 4, content: "My first time booking a spooner, they did not disappoint" },
  { rating: 4, content: "Reliable spoon" },
  { rating: 4, content: "Lunch & spoon" }
]

spoon_counter = 0
review_counter = 0

# Seed Spooner
10.times do
  details = {
    name: Faker::Superhero.name,
    age: rand(18..50),
    spoon_type: ["big spoon", "little spoon", "any spoon"].sample,
    gender: ["male", "female"].sample,
    price: rand(2..100),
    overview: SPOONER_OVERVIEW[spoon_counter]
  }
  spooner = Spooner.create(details)
  file1 = URI.open("https://source.unsplash.com/random/?person")
  spooner.img.attach(io: file1, filename: "#{spooner.name}1.jpg", content_type: "image/jpg")
  file2 = URI.open("https://source.unsplash.com/random/?person")
  spooner.img.attach(io: file2, filename: "#{spooner.name}2.jpg", content_type: "image/jpg")
  file3 = URI.open("https://source.unsplash.com/random/?person")
  spooner.img.attach(io: file3, filename: "#{spooner.name}3.jpg", content_type: "image/jpg")
  spooner.save
  # Seed Review
  2.times do
    review = Review.new(REVIEW_CONTENT[review_counter])
    review.spooner = spooner
    review.save
    review_counter += 1
  end
  spoon_counter += 1
end

puts "seeding complete"
