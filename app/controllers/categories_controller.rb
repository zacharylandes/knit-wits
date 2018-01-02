class CategoriesController < ApplicationController
  def show
    @items = Item.where(category_id: params[:id])
    render "items/index"
  end
end
