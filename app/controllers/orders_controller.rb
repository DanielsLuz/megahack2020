class OrdersController < ApplicationController
  def index
  end

  def create
    Order.create!(time_slot: params[:time_slot], restaurant: params[:restaurant_id], item_ids: [params[:item_id]])

    redirect_to root_path, notice: "Seu pedido foi feito com sucesso!"
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @orders = [] # @restaurant.orders
  end

  def time_slots
    @free_time_slots = Owner.first.time_slots
  end

  private

  def order_params
    params.permit(:time_slot)
  end
end