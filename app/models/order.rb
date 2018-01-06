class Order < ApplicationRecord
  validates_presence_of :status, :street, :state, :zipcode, :city
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(Ordered Paid Completed Cancelled)
  enum state: %w(AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY)
end
