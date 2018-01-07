class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  helper_method :cart_total_price

  def show
    # if session[:user_id]
    #   @user = User.find(session[:user_id])
    # end
      @items = @cart.items.map {|item|Item.find(item.to_i)}
  end


  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart!"
    redirect_to cart_path
  end

  def update
    item = Item.find(params[:item_id])
    @cart.adjust_item(params[:item_id], params[:item][:quantity])
    session[:cart] = @cart.contents
    flash.notice = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart!"
    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:item_id])
    @cart.remove_item(item.id)
    session[:cart] = @cart.contents
    flash.notice = "Successfully removed #{view_context.link_to(item.title,item_path(item))} from your cart.".html_safe
    redirect_to cart_path
  end

  def cart_total_price
    @cart.contents.map { |key, value| Item.find(key.to_i).price * value.to_i }.sum
  end
end
