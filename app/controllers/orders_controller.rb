
class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def new
  end

  def create
    @order = Order.create(user: current_user)
    items = @order.items <<  @cart.items.map {|item|Item.find(item.to_i)}
    flash[:success] = "You order was successfully placed"
    redirect_to orders_path
  end


private

  def order_params
    params.require(:order).permit(:status)
  end

end
