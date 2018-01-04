class Item < ApplicationRecord
  belongs_to :category
  after_initialize :set_default_status
  validates_presence_of :title, :description, :image, :price

  enum status: [:retired, :active, :out_of_stock]

  def set_default_status
    self.status = "active"
  end

  def price_in_dollars
    "$#{sprintf('%.2f', price/100)}"
  end

  def active?
    status == "active"
  end
end
