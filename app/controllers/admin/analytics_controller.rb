class Admin::AnalyticsController < ApplicationController
  helper_method :state_sort

  def index
    @user_orders = User.user_most_orders if !User.all.empty?
    @categories = Category.all
    @retired_items = Item.retired_items
    @orders_by_state = Order.completed_by_state(params[:sort])
  end

  private

    def state_sort
      [
        ["State, A-Z", "users.state ASC"],
        ["State, Z-A", "users.state DESC"],
        ["Count, Low to High ", "count_all ASC"],
        ["Count, High to Low", "count_all DESC"]
      ]
    end
end
