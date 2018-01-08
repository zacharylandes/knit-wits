class Admin::AnalyticsController < ApplicationController
  def index
    @user_orders = User.user_most_orders if !User.all.empty?
    @categories_with_highest_price = Item.categories_with_highest_price if !Item.all.empty?
  end
end
