class Admin::DashboardController < Admin::BaseController

  def index
    @orders_by_status = Order.all.group(:status).count
    @statuses = Order.statuses

    if !params[:filter].nil?
      @orders = Order.where("status = #{params[:filter]}").order("id ASC").paginate(:page => params[:page], :per_page => 30)
    else
      @orders = Order.all.order("id ASC").paginate(:page => params[:page], :per_page => 15)
    end
  end

end
