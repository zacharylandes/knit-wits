class CartsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    flash.notice = "You now have 1 #{item.title} in your cart!"
    redirect_to items_path
  end
end
