class ItemsController < ApplicationController
  def index
    @items = Item.all.paginate(:page => params[:page], :per_page => 15)
  end
end
