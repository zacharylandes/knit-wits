class OrdersController < ApplicationController
  def update
    @order = Order.find(params[:id])
    if params[:status] && current_admin?
      @order.update(status: params[:status])
      redirect_to admin_dashboard_path
    end
  end

end
