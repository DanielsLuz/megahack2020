class RestaurantsController < ApplicationController
  before_action :set_restaurant_id, only: %i[menu reservation_times]
  before_action :set_restaurant, only: %i[show]

  def index
    @restaurants = Restaurant.all
  end

  def menu
    @menu = Restaurant.find(@restaurant_id).items
  end

  def show
    @items = @restaurant.items
  end

  private

  def set_restaurant_id
    @restaurant_id = params[:restaurant_id]
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
