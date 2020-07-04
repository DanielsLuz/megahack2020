class RestaurantsController < ApplicationController
  before_action :set_restaurant_id, only: %i[menu reservation_times orders]
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

  def orders
    @orders = Order.where(restaurant_id: @restaurant_id)
  end

  def code
  end

  def check_code
    restaurant = Restaurant.find_by(code: params[:code])
    if restaurant
      redirect_to restaurant_path(restaurant[:id])
    else
      redirect_to orders_path, alert: 'Código inválido!'
    end
  end

  private

  def set_restaurant_id
    @restaurant_id = params[:restaurant_id]
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
