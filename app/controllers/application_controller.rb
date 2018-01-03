class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :sort_methods

  def sort_methods
    [
      ["Price, Low to High", "price ASC"],
      ["Price, High to Low", "price DESC"],
      ["Alphabetically, A-Z", "title ASC"],
      ["Alphabetically, Z-A", "title DESC"]
    ]
  end
end
