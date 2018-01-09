class Admin::AnalyticsController < ApplicationController
  def index
    @user_orders = User.user_most_orders if !User.all.empty?
    @categories = Category.all
    @retired_items = Item.retired_items
    byebug
    if params[:sort] == "count"
      byebug
      @orders_by_state = Order.state_by_order_count
    else
      @orders_by_state = Order.state_by_alphabetical
    end
  end
end
