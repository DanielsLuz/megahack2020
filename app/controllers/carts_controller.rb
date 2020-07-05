class CartsController < ApplicationController
  def add_item
    item = Item.find(params[:item_id])
    session["cart"] ||= { "items" => [] }
    session["cart"]["items"] << item
    redirect_to restaurant_menu_path(params[:restaurant_id], time_slot_id: params[:time_slot_id]),
      notice: "Item adicionado com sucesso!"
  end

  def create
  end
end
