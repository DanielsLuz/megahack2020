class RestaurantsController < ApplicationController
  before_action :set_restaurant_id, only: %i[menu reservation_times]

  RESTAURANTS = [
    { 
      id: 1,
      name: 'Pizzaria da Nonna',
      description: 'A melhor pizza em forno de pedra da cidade',
      color: 'bg-red-400',
    },
    { 
      id: 2,
      name: 'Z Deli Sanduíches',
      description: 'A melhor hamburgueria da praça',
      color: 'bg-blue-400',
    },
    { 
      id: 3,
      name: 'Al Habibi',
      description: 'Shawarma, esfihas, falafel e especialidades árabes.',
      color: 'bg-orange-400',
    },
    { 
      id: 4,
      name: 'Restaurante Marietta',
      description: 'Massas fresquinhas para agradar seu dia',
      color: 'bg-green-500',
    }
  ]

  MENUS = {
    '1': [
      { id: 1, name: 'já volto', value: '21.9', description: 'massa finíssima' },
      { id: 2, name: 'coca', value: '6.9', description: 'gelaaaada' }
    ],
    '2': [
      { id: 1, name: 'agua', value: '2.9', description: '' },
      { id: 2, name: 'coca', value: '6.9', description: 'gelaaaada' },
      { id: 3, name: 'latão', value: '5.9', description: 'Heineken' }
    ],
    '3': [
      { id: 1, name: 'esfiha', value: '1.9', description: 'carne moída e tomate' },
      { id: 2, name: 'shawarma', value: '15.9', description: 'frando desfiado, fritas, alface, tomate' },
      { id: 3, name: 'falafel', value: '11.9', description: 'porção com 6 unidades' }
    ],
    '4': [
      { id: 1, name: 'macarrão', value: '21.9', description: 'prato bem servido, acompanha queijo parmesão e azeite' },
      { id: 2, name: 'lasagna', value: '16.9', description: 'a original, feita com massa fresquinha, molho de tomate original' }
    ],
  }

  def index
    @restaurants = RESTAURANTS
  end

  def menu
    @menu = MENUS[@restaurant_id.to_sym]
  end

  private

  def set_restaurant_id
    @restaurant_id = params[:restaurant_id]
  end
end
