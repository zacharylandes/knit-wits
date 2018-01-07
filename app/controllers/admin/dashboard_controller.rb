class Admin::DashboardController < Admin::BaseController

  def index
    @orders_by_status = Order.all.group(:status).count
    @statuses = Order.statuses

    if params[:status]
      @orders = Order.where("status = #{params[:status]}")
    else
      @orders = Order.all
    end
  end

end
