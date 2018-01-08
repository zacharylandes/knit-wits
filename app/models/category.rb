class Category < ApplicationRecord
  has_many :item_categories
  has_many :items, through: :item_categories

  validates :name, presence: true, uniqueness: true
  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

  def highest_priced_item
    items.order("price DESC").first
  end

  def total_orders
    items.joins(:order_items).group(:order_id).count.length
  end
end
