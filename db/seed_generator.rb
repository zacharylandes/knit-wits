require 'faker'
require 'csv'

class SeedGenerator
  def users
    users = []
    30.times do |time|
      character = Faker::Simpsons.character
      users << ["#{character}_#{time}",
                character,
                Faker::Address.street_address,
                Faker::Address.city,
                rand(49),
                Faker::Address.zip_code]
    end
    users
  end

  def orders
    orders = []
    2500.times do
      date = Faker::Date.backward(500)
      orders << [rand(3),
                 rand(29),
                 date,
                 date]
    end
    orders
  end

  def order_items
    order_items = []
    15000.times do
      order_items << [rand(15),
                      rand(2500),
                      rand(5)]
    end
    order_items
  end

  def load_users
    CSV.open("db/seed_data/users.csv", "w") do |csv|
      csv << %w(username full_name street city state zipcode)
      users.each do |resource|
        csv << resource
      end
    end
  end

  def load_orders
    CSV.open("db/seed_data/orders.csv", "w") do |csv|
      csv << %w(status user_id created_at updated_at)
      orders.each do |resource|
        csv << resource
      end
    end
  end

  def load_order_items
    CSV.open("db/seed_data/order_items.csv", "w") do |csv|
      csv << %w(item_id order_id quantity)
      order_items.each do |resource|
        csv << resource
      end
    end
  end
end
