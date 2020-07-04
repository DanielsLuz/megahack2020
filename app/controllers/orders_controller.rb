class OrdersController < ApplicationController
  def index
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
end
