class Item < ApplicationRecord
  belongs_to :category

  def price_in_dollars
    "$#{sprintf('%.2f', price/100)}"
  end
end
