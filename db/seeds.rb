# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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
  image: "products/anna_hat.jpg",
  category: hats)

Item.create!(title: "Antlers",
  description: "Are those real antlers? Of course not, they're made of wool",
  price: 1500,
  image: "products/antler_hat.jpg",
  category: hats)

Item.create!(title: "Baby Button-Up",
  description: "Blue baby sweater",
  price: 7500,
  image: "products/baby_sweater2.jpg",
  category: sweaters)

Item.create!(title: "Badger",
  description: "Honey Badger Don't Give a F@CK",
  price: 2000,
  image: "products/badger_mitts4.jpg",
  category: mittens)

Item.create!(title: "Bam Pow",
  description: "Inspired from retro Batman!",
  price: 2000,
  image: "products/bam_pow.jpg",
  category: mittens)

Item.create!(title: "Blue Cardigan",
  description: "Wool cardigan with pattern on arms",
  price: 10000,
  image: "products/blue_cardi4.jpg",
  category: sweaters)

Item.create!(title: "Goldenrod",
  description: "What a cool pattern!!",
  price: 10000,
  image: "products/goldenrod_sweater.jpg",
  category: sweaters)

Item.create!(title: "Beautiful Blue",
  description: "Your friends will say Wowzers!!",
  price: 4500,
  image: "products/blue_shawl1.jpg",
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
  image: "products/owl_mitts.jpg",
  category: mittens)
