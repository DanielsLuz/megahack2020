class OrdersController < ApplicationController
  def index
  end

  def create
    render json: order_params
  end

  private

  def order_params
    params.permit(:item_id, :restaurant_id, :time_slot)
  end
end
