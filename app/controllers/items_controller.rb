class ItemsController < ApplicationController
  def index
  end

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    Item.create(item_params)
    
    redirect_to restaurant_path(params[:restaurant_id])
  end

  private

  def item_params
    params.permit(:name, :value, :description, :restaurant_id)
  end
end
