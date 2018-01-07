class Admin::AnalyticsController < ApplicationController
  def index
    @user_orders = User.user_most_orders
    @category_pricey = Category.highest_price
  end

end
