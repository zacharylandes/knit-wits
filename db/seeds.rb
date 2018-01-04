# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "database_cleaner"
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

mittens = Category.create(name: "Mittens")
hats = Category.create(name: "Hats")
sweaters = Category.create(name: "Sweaters")
cowls = Category.create(name: "Cowls")

Item.create!(title: 'Thrummed Mitt',
  description: "Super warm mitts with extra wooly bits inside",
  price: 1000,
  image: "products/thrummed_mitts1.jpg",
  category: mittens)

Item.create!(title: "Anna's Favorite",
  description: "Purple wooly hat perfect for a newborn",
  price: 1000,
  image: "products/anna_hat.JPG",
  category: hats)

Item.create!(title: "Antlers",
  description: "Are those real antlers? Of course not, they're made of wool",
  price: 1500,
  image: "products/antler_hat.JPG",
  category: hats)

Item.create!(title: "Baby Button-Up",
  description: "Blue baby sweater",
  price: 7500,
  image: "products/baby_sweater2.JPG",
  category: sweaters)

Item.create!(title: "Badger",
  description: "Honey Badger Don't Give a F@CK",
  price: 2000,
  image: "products/badger_mitts4.JPG",
  category: mittens)

Item.create!(title: "Bam Pow",
  description: "Inspired from retro Batman!",
  price: 2000,
  image: "products/bam_pow.JPG",
  category: mittens)

Item.create!(title: "Blue Cardigan",
  description: "Wool cardigan with pattern on arms",
  price: 10000,
  image: "products/blue_cardi4.JPG",
  category: sweaters)

Item.create!(title: "Goldenrod",
  description: "What a cool pattern!!",
  price: 10000,
  image: "products/goldenrod_sweater.JPG",
  category: sweaters)

Item.create!(title: "Beautiful Blue",
  description: "Your friends will say Wowzers!!",
  price: 4500,
  image: "products/blue_shawl1.JPG",
  category: cowls)

Item.create!(title: "Foxy",
  description: "NOT A REAL FOX",
  price: 4000,
  image: "products/fox_scarf.jpg",
  category: cowls)

Item.create!(title: "Joan of Arc",
  description: "Lead your armies to victory",
  price: 4500,
  image: "products/joan_of_arc_scarf.jpg",
  category: cowls)

Item.create!(title: "Owl You Warm?",
  description: "I'm not just warm, I'm HOOT!",
  price: 2500,
  image: "products/owl_mitts.JPG",
  category: mittens)

Item.create!(title: "Space Invader Sweater",
  description: "Bring back your favorite game with this gem!",
  price: 10000,
  image: "products/space_invaders2.JPG",
  category: sweaters)

Item.create!(title: "Hand Puppet",
  description: "Who won't want to talk to your hand with these mittens",
  price: 1500,
  image: "products/hand_puppet1.JPG",
  category: mittens)

Item.create!(title: "Seaside Cowl",
  description: "Seaside inspired cowl, super warm",
  price: 2500,
  image: "products/seaside_cowl2.JPG",
  category: cowls)


Item.create!(title: "Green Cables Hat",
  description: "Warm green hat with thick styles",
  price: 2500,
  image: "products/green_cables_hat.JPG",
  category: hats)
