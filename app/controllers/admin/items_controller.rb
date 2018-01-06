
class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all.paginate(:page => params[:page], :per_page => 15)
    @category =Category.all
  end

  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save!
      redirect_to admin_items_path
    end
  end

  def show
    redirect_to admin_items_path
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

  def item_params
    params.require(:item).permit(:title,:description, :price, :image,:category_id, :status)
  end

end