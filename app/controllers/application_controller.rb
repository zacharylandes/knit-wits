class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :sort_methods, :current_user, :current_admin?

  def sort_methods
    [
      ["Price, Low to High", "price ASC"],
      ["Price, High to Low", "price DESC"],
      ["Alphabetically, A-Z", "title ASC"],
      ["Alphabetically, Z-A", "title DESC"]
    ]
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(id: session[:user_id])
  end

  def current_admin?
    current_user && current_user.admin?
  end

    private

    def set_cart
      @cart = Cart.new(session[:cart])
    end
end
