class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def price_in_dollars(price)
    "$#{sprintf('%.2f', price/100)}"
  end
end
