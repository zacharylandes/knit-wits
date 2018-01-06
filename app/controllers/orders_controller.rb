
class OrdersController < ApplicationController

  def index
    @orders = Order.all.paginate(:page => params[:page], :per_page => 15)
  end

  def new
    @order= Order.new
    @im = Item.new
  end

  def create
    @order = Order.create!(user_id: session[:user_id] )
    @items = @order.items << Item.where(@cart.items)
    redirect_to user_orders_path(session[:user_id])
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @category = Category.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    flash[:success] = "item updated!"
    redirect_to admin_items_path
  end

  def destroy
    @item= Items.find(params[:id])
    @item.destroy
      flash[:success] = "item deleted!"
      redirect_to admin_items_path
  end

private

  def order_params
    params.require(:order).permit(:status)
  end

end
