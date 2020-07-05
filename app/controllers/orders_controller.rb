class OrdersController < ApplicationController
  def index
  end

  def create
    Order.create!(order_params)

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
    params
      .permit(:time_slot_id, :restaurant_id, :phone_number)
      .merge(item_ids: [params[:item_id]])
  end
end
