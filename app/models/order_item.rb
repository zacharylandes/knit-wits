class OrderItem < ApplicationRecord
  # attr_reader :quantity

  belongs_to :item
  belongs_to :order

  #
  # def quantity
  #   quantity
  # end
  #
  # def order_total
  #   byebug
  #   quantity * item.price
  # end

end
