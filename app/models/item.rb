class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :item_categories
  has_many :categories, through: :item_categories
  has_many :order_items
  has_many :orders, through: :order_items
  validates_presence_of :title, :status, :description, :price
  validates :price, numericality: { greater_than: 0 }
  validates :title, uniqueness: true

  enum status: [:retired, :active, :out_of_stock]

  def price_in_dollars
    "$#{sprintf('%.2f', price/100)}"
  end

  def active?
    status == "active"
  end

  def retired?
    status == "retired"
  end

  def out_of_stock?
    status == "out_of_stock"
  end

  def self.categories_with_highest_price
    order("price DESC").first.categories
  end

end
