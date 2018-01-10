class Admin::ItemsController < Admin::BaseController
  helper_method :item_status_filter

  def index
    if params[:filter].nil? || params[:filter] == "all"
      @items = Item.sort(params[:sort])
    else
      @items = Item.sort(params[:sort]).where(status: params[:filter])
    end
    @category =Category.all
  end

  def show
    redirect_to admin_items_path
  end

  def new
    @item = Item.new
    @category = Category.all
  end

  def create
    @item =Item.new(item_attributes)
    if item_params[:image].nil? && @item.save
      @item.update_column(:image, "app/assets/images/item_default.jpg")
      redirect_to admin_items_path
    elsif @item.save
      redirect_to admin_items_path
    else
      flash.notice = "Invalid Attributes, Make Sure Item Attributes are Valid"
      redirect_to new_admin_item_path
    end
  end

  def edit
    @category = Category.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if params[:status]
      @item.update(status: params[:status])
      flash[:success] = "Item Status Updated to #{@item.status}!"
      redirect_to admin_items_path
    else
      @item.update(item_attributes)
      flash[:success] = "Item Updated!"
      redirect_to admin_items_path
    end
  end

  def destroy
    @item= Items.find(params[:id])
    @item.destroy
      flash[:success] = "item deleted!"
      redirect_to admin_items_path
  end

private

  def item_status_filter
    [
      ["All", "all"],
      ["Retired", "retired"],
      ["Active", "active"]
    ]
  end

  def item_params
    params.require(:item).permit(:title,:description, :price, :image, {:categories => []}, :status)
  end

  def item_categories(item_params)
    categories = item_params[:categories]
    categories.reduce([]) do |results, category|
      if category != ""
        results << Category.find(category)
      end
      results
    end
  end

  def item_attributes
    item_attributes = item_params
    item_attributes[:categories] = item_categories(item_params) if item_params[:categories]
    item_attributes
  end
end
