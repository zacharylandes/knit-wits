class Item < ApplicationRecord
  belongs_to :category
  validates_presence_of :title, :description, :image, :price

  def price_in_dollars
    "$#{sprintf('%.2f', price/100)}"
  end
end
