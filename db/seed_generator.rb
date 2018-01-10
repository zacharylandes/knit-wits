require 'faker'
require 'csv'

class SeedGenerator
  attr_reader :users_count, :orders_count

  def initialize(users, orders, order_items)
    users.nil? ? @users_count = 30 : @users_count = users.to_i
    orders.nil? ? @orders_count = 1000 : @orders_count = orders.to_i
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
      orders << [rand(0..3), #4 different order statuses
                 rand(1..users_count), # number of users
                 date,
                 date]
    end
    orders
  end

  def choose_item(time)
    if (time % 3) == 0
      rand(1..6)
    elsif (time % 3) == 1
      rand(7..11)
    else
      rand(12..16)
    end
  end

  def order_items
    order_items = []
    order_items << %w(item_id order_id quantity)
    (orders_count * 3).times do |time|
      order_items << [choose_item(time), #ensures duplicate items are not in order
                      (time / 3), #builds 3 order items per order
                      rand(1..5)] #max quantity of one item on order
    end
    order_items
  end

  def retired_items
    retired_items = []
    retired_items << %w(item_id)
    item_id = 1
    data_distribution = [1, 6, 6, 1, 7, 5, 7, 2, 0, 5, 10, 5, 3, 7, 4, 0]
    data_distribution.each do |times_retired|
      times_retired.times do
        retired_items << [item_id]
      end
      item_id += 1
    end
    retired_items
  end

  def load_retired_items
    CSV.open("data/retired_items.csv", "w") do |csv|
      retired_items.each do |resource|
        csv << resource
      end
    end
  end

  def load_users
    CSV.open("data/users.csv", "w") do |csv|
      users.each do |resource|
        csv << resource
      end
    end
  end

  def load_orders
    CSV.open("data/orders.csv", "w") do |csv|
      orders.each do |resource|
        csv << resource
      end
    end
  end

  def load_order_items
    CSV.open("data/order_items.csv", "w") do |csv|
      order_items.each do |resource|
        csv << resource
      end
    end
  end
end
