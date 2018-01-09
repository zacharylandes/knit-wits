class Admin::AnalyticsController < ApplicationController
  def index
    @user_orders = User.user_most_orders if !User.all.empty?
    @categories = Category.all
    @retired_items = Item.retired_items
  end
end
