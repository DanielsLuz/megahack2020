class RestaurantsController < ApplicationController
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
      { name: 'já volto', value: '21.9', description: 'massa finíssima' },
      { name: 'coca', value: '6.9', description: 'gelaaaada' }
    ],
    '2': [
      { name: 'agua', value: '2.9', description: '' },
      { name: 'coca', value: '6.9', description: 'gelaaaada' },
      { name: 'latão', value: '5.9', description: 'Heineken' }
    ],
    '3': [
      { name: 'esfiha', value: '1.9', description: 'carne moída e tomate' },
      { name: 'shawarma', value: '15.9', description: 'frando desfiado, fritas, alface, tomate' },
      { name: 'falafel', value: '11.9', description: 'porção com 6 unidades' }
    ],
    '4': [
      { name: 'macarrão', value: '21.9', description: 'prato bem servido, acompanha queijo parmesão e azeite' },
      { name: 'lasagna', value: '16.9', description: 'a original, feita com massa fresquinha, molho de tomate original' }
    ],
  }

  def index
    @restaurants = RESTAURANTS
  end

  def menu
    @menu = MENUS[params[:restaurant_id].to_sym]
  end
end
