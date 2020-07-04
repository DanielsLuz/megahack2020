class OrdersController < ApplicationController
  def index
  end

  def create
    render json: order_params
  end

  def check_code
    restaurant = Restaurant.find_by(code: params[:code])
    if restaurant
      redirect_to restaurant_path(restaurant[:id])
    else
      redirect_to orders_path, alert: 'Código inválido!'
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @orders = [] # @restaurant.orders
  end

  private

  def order_params
    params.permit(:item_id, :restaurant_id, :time_slot)
  end
end
