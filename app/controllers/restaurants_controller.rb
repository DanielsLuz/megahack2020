class RestaurantsController < ApplicationController
  before_action :set_restaurant_id, only: %i[menu reservation_times]
  before_action :set_restaurant, only: %i[show]

  RESTAURANTS = [
    {
      id: 1,
      name: 'Pizzaria da Nonna',
      description: 'A melhor pizza em forno de pedra da cidade',
      code: 1234,
      color: 'bg-red-400',
      orders: [{ id: 1, items: [{ name: 'já volto', value: '21.9', description: 'massa finíssima' }] }]
    },
    {
      id: 2,
      name: 'Z Deli Sanduíches',
      description: 'A melhor hamburgueria da praça',
      code: 4567,
      color: 'bg-blue-400',
    },
    {
      id: 3,
      name: 'Al Habibi',
      description: 'Shawarma, esfihas, falafel e especialidades árabes.',
      code: 1122,
      color: 'bg-orange-400',
    },
    {
      id: 4,
      name: 'Restaurante Marietta',
      description: 'Massas fresquinhas para agradar seu dia',
      code: 1123,
      color: 'bg-green-500',
    }
  ]

  def index
    @restaurants = Restaurant.all
  end

  def menu
    @menu = Restaurant.find(@restaurant_id).items
  end

  def show
    @items = @restaurant.items
  end

  private

  def set_restaurant_id
    @restaurant_id = params[:restaurant_id]
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
