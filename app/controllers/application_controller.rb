class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :logged_in?
  before_action :set_cart
  helper_method :item_sort
  helper_method :price_in_dollars
  helper_method :states_helper
  helper_method :current_admin?


  def item_sort
    [
      ["Title, A-Z", "title ASC"],
      ["Title, Z-A", "title DESC"],
      ["Price, Low to High", "price ASC"],
      ["Price, High to Low", "price DESC"]
    ]
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] && User.exists?(id: session[:user_id])
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def price_in_dollars(price)
    "$#{sprintf('%.2f', price/100)}"
  end

  def states_helper
    User.states
  end

  def logged_in?
    !current_user.nil?
  end

    private

    def require_logged_in
      render file: "/public/404" unless logged_in?
    end

    def set_cart
      @cart = Cart.new(session[:cart])
    end

    def render_404
      respond_to do |format|
        format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
        format.xml  { head :not_found }
        format.any  { head :not_found }
      end
    end

end
