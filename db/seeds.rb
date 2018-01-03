# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
category = Category.create(name: "Mittens", id: 2)
item = Item.create!(title: 'Thrummed Mitts',
  description: "Super warm mitts with extra wooly bits inside",
  price: 1000, image: "./assets/images/thrummed_mitts1.jpg",
  category_id: 2)
