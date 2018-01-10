class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates_presence_of :full_name, :street, :state, :zipcode, :city
  has_many :orders

  enum role: %w(default admin)
  enum state: %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)

  def self.user_most_orders
    select('users.*, count(orders.user_id) as orders_count')
    .joins(:orders)
    .group('users.id')
    .order('orders_count DESC').first.username
  end
end
