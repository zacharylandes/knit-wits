class OrdersController < ApplicationController
  helper_method :order_sub
  helper_method :order_total
  require 'date'

  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
    if current_user != @order.user && !current_admin?
      flash.notice = "Order belongs to another user"
      redirect_to root_path
    end
  end

  def create
    @order = Order.create!(user: current_user, status:0)
    @cart.contents.each do |item, quantity|
      OrderItem.create(item_id: item.to_i, order_id: @order.id, quantity: quantity)
    end
      session[:cart].clear
      flash[:success] = "You order was successfully placed"
      redirect_to orders_path
  end

  def update
    @order = Order.find(params[:id])
    if params[:status] && current_admin?
      @order.update(status: params[:status])
      redirect_to admin_dashboard_path
    end
  end


private

  def order_params
    params.require(:order).permit(:status)
  end

end
