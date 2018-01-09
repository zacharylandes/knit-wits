class Admin::OrdersController < Admin::BaseController
  def update
    @order = Order.find(params[:id])
    if params[:status] && current_admin?
      @order.update(status: params[:status])
      flash.notice = "Order #{@order.id} Status was updated to #{params[:status]}"
      redirect_to admin_dashboard_path(filter: params[:filter])
    end
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
