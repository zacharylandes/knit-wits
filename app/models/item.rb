class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :category

  validates_presence_of :title, :status, :description, :price

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

end
