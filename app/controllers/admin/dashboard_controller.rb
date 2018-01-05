class Admin::DashboardController < Admin::BaseController

  def index
    @item = Item.new
    @items = Item.all
    @category =Category.all
  end

end
