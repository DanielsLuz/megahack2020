class OrdersController < ApplicationController
  def index
  end

  def create
    render json: order_params
  end

  def check_code
    code = params[:code]
    restaurant = RestaurantsController::RESTAURANTS.find { |r| r[:code] == code }
    if restaurant
      redirect_to order_path(restaurant[:id])
    else
      redirect_to orders_path, alert: 'Código inválido!'
    end
  end

  def show
  end

  private

  def order_params
    params.permit(:item_id, :restaurant_id, :time_slot)
  end
end
