class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  def line_item_subtotal
    item.price * quantity
  end

  def subtotal_in_dollars
    price_in_dollars(line_item_subtotal)
  end
end
