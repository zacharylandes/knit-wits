class Category < ApplicationRecord
  has_many :items
  validates :name, presence: true, uniqueness: true
  before_save :generate_slug

  def generate_slug
    self.slug = name.parameterize
  end

  def self.highest_price
    byebug
    select(:item)
  end
end
