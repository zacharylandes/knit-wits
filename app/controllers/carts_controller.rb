class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def index
     @items = @cart.items.map {|item|Item.find(item.to_i)}
     @total = @item
  end


  # def update
  #   item = Item.find(params[:item_id])
  #   @cart.subtract_item(item.id)
  # end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart!"
    redirect_to items_path
  end

  def update
    item = Item.find(params[:item_id])
    @cart.subtract_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart!"
    redirect_to carts_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "You have deleted #{view_context.link_to(item.title,item_path(item))} from your cart!".html_safe
   redirect_to carts_path
  end
end
