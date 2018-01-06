class WelcomeController < ApplicationController
  def index
    @items = Item.all.sample(3)
  end
end
