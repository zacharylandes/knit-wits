class CategoriesController < ApplicationController
  def show
    @items = Item.where(category_id: params[:id]).paginate(:page => params[:page], :per_page => 15)
    render "items/index"
  end
end
