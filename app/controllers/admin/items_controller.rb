
class Admin::ItemsController < ApplicationController
  def index
    @items = Items.all
  end

  def new
    @item = Items.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save!
      redirect_to admin_dashboard_path
    end
  end

  def show
    redirect_to admin_items_path
  end

  def destroy
    @item= Items.find(params[:id])
    @item.destroy
      flash[:success] = "item deleted!"
      redirect_to admin_items_path
  end

private

  def item_params
    params.require(:item).permit(:title,:description, :price, :image,:category_id, :status)
  end

end
