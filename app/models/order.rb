class Order < ApplicationRecord
  validates_presence_of :status
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  enum status: %w(Ordered Paid Completed Cancelled)

  def order_total
    order_items.map do |line_item|
      items.find(line_item.item_id).price * line_item.quantity
    end.sum
  end

  def total_in_dollars
    price_in_dollars(order_total)
  end

  def self.completed_by_state(sort)
    sort = "users.state" if sort.nil?
    joins(:user)
    .where(status: "Completed")
    .group("users.state")
    .order(sort)
    .count
  end
end
