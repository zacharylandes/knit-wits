class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def index
     @items = @cart.items.map {|item|Item.find(item.to_i)}
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart!"
    redirect_to items_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "You have deleted #{item.title} from your cart!"
   redirect_to carts_path
  end
end
