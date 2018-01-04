# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mittens = Category.create(name: "Mittens", image: asset_path("products/thrummed_mitts1.jpg"))
hats = Category.create(name: "Hats", image: asset_path("products/green_cables_hat.JPG"))
sweaters = Category.create(name: "Sweaters", image: asset_path("products/baby_sweater2.JPG"))
cowls = Category.create(name: "Cowls", image: asset_path("products/blue_shawl1.JPG"))

Item.create!(title: 'Thrummed Mitt',
  description: "Super warm mitts with extra wooly bits inside",
  price: 1000,
  image: asset_path("products/thrummed_mitts1.jpg"),
  category: mittens,
  status: 1)

Item.create!(title: "Anna's Favorite",
  description: "Purple wooly hat perfect for a newborn",
  price: 1000,
  image: asset_path("products/anna_hat.JPG"),
  category: hats,
  status: 1)

Item.create!(title: "Antlers",
  description: "Are those real antlers? Of course not, they're made of wool",
  price: 1500,
  image: asset_path("products/antler_hat.JPG"),
  category: hats,
  status: 1)

Item.create!(title: "Baby Button-Up",
  description: "Blue baby sweater",
  price: 7500,
  image: asset_path("products/baby_sweater2.JPG"),
  category: sweaters,
  status: 1)

Item.create!(title: "Badger",
  description: "Honey Badger Don't Give a F@CK",
  price: 2000,
  image: asset_path("products/badger_mitts4.JPG"),
  category: mittens,
  status: 1)

Item.create!(title: "Bam Pow",
  description: "Inspired from retro Batman!",
  price: 2000,
  image: asset_path("products/bam_pow.JPG"),
  category: mittens,
  status: 1)

Item.create!(title: "Blue Cardigan",
  description: "Wool cardigan with pattern on arms",
  price: 10000,
  image: asset_path("products/blue_cardi4.JPG"),
  category: sweaters,
  status: 1)

Item.create!(title: "Goldenrod",
  description: "What a cool pattern!!",
  price: 10000,
  image: asset_path("products/goldenrod_sweater.JPG"),
  category: sweaters,
  status: 1)

Item.create!(title: "Beautiful Blue",
  description: "Your friends will say Wowzers!!",
  price: 4500,
  image: asset_path("products/blue_shawl1.JPG"),
  category: cowls,
  status: 1)

Item.create!(title: "Foxy",
  description: "NOT A REAL FOX",
  price: 4000,
  image: asset_path("products/fox_scarf.jpg"),
  category: cowls,
  status: 1)

Item.create!(title: "Joan of Arc",
  description: "Lead your armies to victory",
  price: 4500,
  image: asset_path("products/joan_of_arc_scarf.jpg"),
  category: cowls,
  status: 1)

Item.create!(title: "Owl You Warm?",
  description: "I'm not just warm, I'm HOOT!",
  price: 2500,
  image: asset_path("products/owl_mitts.JPG"),
  category: mittens,
  status: 1)

Item.create!(title: "Space Invader Sweater",
  description: "Bring back your favorite game with this gem!",
  price: 10000,
  image: asset_path("products/space_invaders2.JPG"),
  category: sweaters,
  status: 1)

Item.create!(title: "Hand Puppet",
  description: "Who won't want to talk to your hand with these mittens",
  price: 1500,
  image: asset_path("products/hand_puppet1.JPG"),
  category: mittens,
  status: 1)

Item.create!(title: "Seaside Cowl",
  description: "Seaside inspired cowl, super warm",
  price: 2500,
  image: asset_path("products/seaside_cowl2.JPG"),
  category: cowls,
  status: 1)


Item.create!(title: "Green Cables Hat",
  description: "Warm green hat with thick styles",
  price: 2500,
  image: asset_path("products/green_cables_hat.JPG"),
  category: hats,
  status: 1)
