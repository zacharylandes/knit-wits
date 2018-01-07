require 'faker'
require 'csv'

class SeedGenerator
  attr_reader :users_count, :orders_count, :order_items_count

  def initialize(users, orders, order_items)
    users.nil? ? @users_count = 30 : @users_count = users.to_i
    orders.nil? ? @orders_count = 1000 : @orders_count = users.to_i
    order_items.nil? ? @order_items_count = 4000 : @order_items_count = users.to_i

  end

  def users
    users = []
    users << %w(username full_name street city state zipcode)
    users_count.times do |time|
      character = Faker::Simpsons.character
      users << ["#{character}_#{time}",
                character,
                Faker::Address.street_address,
                Faker::Address.city,
                rand(49), #number of states
                Faker::Address.zip_code]
    end
    users
  end

  def orders
    orders = []
    orders << %w(status user_id created_at updated_at)
    orders_count.times do
      date = Faker::Date.backward(500)
      orders << [rand(3), #4 different order statuses
                 (rand(users_count-1) + 1), # number of users
                 date,
                 date]
    end
    orders
  end

  def order_items
    order_items = []
    order_items << %w(item_id order_id quantity)
    order_items_count.times do
      order_items << [(rand(15) + 1), #items in database
                      (rand(orders_count-1) + 1), #number of orders
                      rand(5)] #max quantity of one item on order
    end
    order_items
  end

  def load_users
    CSV.open("db/seed_data/users.csv", "w") do |csv|
      users.each do |resource|
        csv << resource
      end
    end
  end

  def load_orders
    CSV.open("db/seed_data/orders.csv", "w") do |csv|
      orders.each do |resource|
        csv << resource
      end
    end
  end

  def load_order_items
    CSV.open("db/seed_data/order_items.csv", "w") do |csv|
      order_items.each do |resource|
        csv << resource
      end
    end
  end
end
