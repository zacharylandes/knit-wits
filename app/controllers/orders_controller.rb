
class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def new
  end

  def create
    @order = Order.create!
    @order.items << Item.find(@cart.items)
    flash[:success] = "You order was successfully placed"
    redirect_to orders_path
  end


private

  def order_params
    params.require(:order).permit(:status)
  end

end
