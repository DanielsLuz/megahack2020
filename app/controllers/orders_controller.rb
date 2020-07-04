class OrdersController < ApplicationController
  def index
  end

  def create
    Order.create!(time_slot: params[:time_slot], restaurant: params[:restaurant_id], item_ids: [params[:item_id]])

    redirect_to root_path, notice: "Seu pedido foi feito com sucesso!"
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
    params.permit(:time_slot)
  end
end
