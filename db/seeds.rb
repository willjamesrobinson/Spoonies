require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database"
Spooner.destroy_all
User.destroy_all
puts "Seeding started"

ADDRESSES = [
  "Carlton, Melbourne", "Richmond, Melbourne", "Collingwood, Melbourne", "Fitzroy, Melbourne", "East Melbourne, Melbourne", "Abbotsford, Melbourne", "Melbourne, Victoria"
]

SPOONER_DETAILS = [
  {
    name: "Big Larry",
    age: 45,
    spoon_type: "big spoon",
    gender: "male",
    price: 30,
    overview: "I'm ready to Netflix and spoon.",
    address: ADDRESSES.sample
  },
  {
    name: Faker::Superhero.name,
    age: 25,
    spoon_type: "any spoon",
    gender: "female",
    price: 45,
    overview: "Open to all spooning experiences",
    address: ADDRESSES.sample
  },
  {
    name: Faker::Superhero.name,
    age: 40,
    spoon_type: "big spoon",
    gender: "male",
    price: 40,
    overview: "My cat hates me so I'll spoon you instead.",
    address: ADDRESSES.sample
  },
  {
    name: "Kim Jong Spoon",
    age: 29,
    spoon_type: "little spoon",
    gender: "male",
    price: 35,
    overview: "I'll be your spoon if you'll be mine.",
    address: ADDRESSES.sample
  },
  {
    name: Faker::Superhero.name,
    age: 27,
    spoon_type: "little spoon",
    gender: "female",
    price: 70,
    overview: "Only spoons accepted, no other cutlery need apply.",
    address: ADDRESSES.sample
  },
  {
    name: "Big Biceps Bonita",
    age: 34,
    spoon_type: "any spoon",
    gender: "female",
    price: 50,
    overview: "As a spoon I'm the whole package, I'm basically a spork.",
    address: ADDRESSES.sample
  },
  {
    name: "Farmer George",
    age: 30,
    spoon_type: "any spoon",
    gender: "male",
    price: 10,
    overview: "Is a shovel just a garden spoon? Because I like to spoon outdoors ;)",
    address: ADDRESSES.sample
  },
  {
    name: Faker::Superhero.name,
    age: 36,
    spoon_type: "big spoon",
    gender: "male",
    price: 15,
    overview: "I'm a bit of a tease spoon.",
    address: ADDRESSES.sample
  },
  {
    name: Faker::Superhero.name,
    age: 31,
    spoon_type: "any spoon",
    gender: "female",
    price: 65,
    overview: "Tell all your friends about my spooning skills, it will cause quite a stir!",
    address: ADDRESSES.sample
  },
  {
    name: Faker::Superhero.name,
    age: 42,
    spoon_type: "little spoon",
    gender: "female",
    price: 45,
    overview: "Are you soup because I want to spoon you.",
    address: ADDRESSES.sample
  },
  {
    name: "Pitty Pitty Bang Bang",
    age: 33,
    spoon_type: "big spoon",
    gender: "female",
    price: 89,
    overview: "Comes with a fun range of spooning accessories",
    address: ADDRESSES.sample
  },
  {
    name: "Long Legs Lachlan",
    age: 30,
    spoon_type: "little spoon",
    gender: "male",
    price: 66,
    overview: "Let me wrap my lengthy legs around your feeble body",
    address: ADDRESSES.sample
  },
  {
    name: "Ariani",
    age: 28,
    spoon_type: "any spoon",
    gender: "female",
    price: 49,
    overview: "Experienced at spooning my dog",
    address: "Richmond, Melbourne"
  }
]

IMAGES = [
  "https://images.unsplash.com/photo-1573878415613-fe2a3f769cab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1573879029680-ef2d3b800dbd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1216&q=80",
  "https://images.unsplash.com/photo-1649242067347-a71ce1eb6a25?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1649242066886-6595b0980849?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1597969892064-a7b26a98c335?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  "https://images.unsplash.com/photo-1610108702802-c26578e1adae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  "https://images.unsplash.com/photo-1611403119860-57c4937ef987?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  "https://images.unsplash.com/photo-1612766959025-ac18e2b3bb96?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  "https://images.unsplash.com/photo-1510274332963-71d4e866fccf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1510623040244-1f396031f3ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1533681717801-1bbd2ec8d269?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1534367507873-d2d7e24c797f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1601912982742-26a940afaa5d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  "https://images.unsplash.com/photo-1624720114708-0cbd6ee41f4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
  "https://images.unsplash.com/photo-1601233748556-fc899bd4305b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1042&q=80",
  "https://images.unsplash.com/photo-1601233749202-95d04d5b3c00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1438&q=80",
  "https://images.unsplash.com/photo-1508002366005-75a695ee2d17?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=668&q=80",
  "https://images.unsplash.com/photo-1589156280159-27698a70f29e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
  "https://images.unsplash.com/photo-1589525231707-f2de2428f59c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
  "https://images.unsplash.com/photo-1498524943437-bd806c1592c8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  "https://images.unsplash.com/photo-1512548438457-4c9584d3766b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2960&q=80",
  "https://images.unsplash.com/photo-1530283236834-b07129fc56b7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2787&q=80",
  "https://images.unsplash.com/photo-1632482151560-ef0645f32999?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2942&q=80",
  "https://images.unsplash.com/photo-1592399832410-451ec2efd5d0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2940&q=80",
  "https://images.unsplash.com/photo-1508329861810-e6f45abf4e95?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1388&q=80",
  "https://images.unsplash.com/photo-1623704793723-0f7458ca957a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80"
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
  { rating: 4, content: "Lunch & spoon" },
  { rating: 1, content: "Over enthusiastic on the wooden spoon. I was uncomfortable." },
  { rating: 5, content: "That wooden spoon is magical" },
  { rating: 2, content: "Lachie sure loves his legs. Me? Less so." },
  { rating: 5, content: "Legs for days" },
  { rating: 4, content: "Has a cute dog" },
  { rating: 4, content: "Dog is a good spooner" }
]

spoon_counter = 0
review_counter = 0
img_counter = 0

user = User.new(
  {
    email: "user@gmail.com",
    password: "123456",
    age: 50,
    first_name: "Bob",
    gender: "male",
    spoon_type: "big spoon"
  }
)
if user.save
  puts "Created a user"
else
  puts "Failed to create a user"
end


# Seed Spooner
num = 0
13.times do
  num += 1
  spooner = Spooner.new(SPOONER_DETAILS[spoon_counter])
  spooner.user = user
  spooner.save
  # Add Images
  2.times do
    file = URI.open(IMAGES[img_counter])
    spooner.img.attach(io: file, filename: "seed_#{img_counter}.jpg", content_type: "image/jpg")
    img_counter += 1
  end
  spooner.save
  # Seed Review
  2.times do
    review = Review.new(REVIEW_CONTENT[review_counter])
    review.spooner = spooner
    review.user = user
    review.save
    review_counter += 1
  end
  spoon_counter += 1
  if spoon_counter == 1
    puts "#{num} Spooner Spooning"
  else
    puts "#{num} Spooners Spooning"
  end
end

puts "seeding complete"
