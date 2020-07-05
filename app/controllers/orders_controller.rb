class OrdersController < ApplicationController
  def index
  end

  def create
    items_by_restaurant = params[:items].map{ |item_id| Item.find(item_id) }.group_by(&:restaurant)

    orders = items_by_restaurant.map do |restaurant, items|
      Order.create!(order_params.merge(restaurant: restaurant, item_ids: items.map(&:id)))
    end

    current_usage = orders.first.time_slot.current_usage
    orders.first.time_slot.update!(current_usage: current_usage + 1)
    session["cart"]["items"] = []
    cookies[:phone_number] = order_params[:phone_number]
    redirect_to time_slots_orders_path, notice: "Seu pedido foi feito com sucesso!"
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @orders = [] # @restaurant.orders
  end

  def time_slots
    lookup_orders
    @free_time_slots = Owner.first.time_slots
  end

  def complete
    @order = Order.find(params[:order_id])
    @order.update!(completed: true)
    @order.time_slot.update(current_usage: @order.time_slot.current_usage - 1)
    redirect_to restaurant_orders_path(@order.restaurant_id), notice: "Enviamos uma notificação para o cliente!"
  end

  private

  def lookup_orders
    if (phone_number = cookies[:phone_number])
      @existing_orders = Order.where(phone_number: phone_number, completed: false)
    end
  end

  def order_params
    params.permit(:time_slot_id, :phone_number)
  end
end
