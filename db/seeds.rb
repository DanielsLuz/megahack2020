Order.destroy_all
Owner.destroy_all
TimeSlot.destroy_all

owner = Owner.create(
  name: 'Shawee Shopping',
  usable_tables_count: 2,
  reservations_start_time: '10:00',
  reservations_end_time: '23:59',
  restaurants: [
    Restaurant.create(
      name: 'McDonalds',
      code: 'mc123',
      description: 'Descrição aqui',
      color: 'red',
      items: [
        Item.create(
          name: 'Big Mac',
          value: 14.50,
          description: 'Não existe nada igual. Dois hambúrgueres, alface, queijo e molho especial, cebola e picles num pão com gergelim.'
        ),
        Item.create(
          name: 'MCPICANHA',
          value: 19.00,
          description: 'McPicanha tem uma combinação deliciosa de hambúrguer feito com carne de picanha com molho de picanha, queijo coalho empanado, tomate, mix de folhas e cebola crispy no pão com gergelim.'
        ),
      ]
    ),

    Restaurant.create(
      name: 'Panelinhas',
      code: 'panelas_50',
      description: 'Descrição aqui',
      color: 'red',
      items: [
        Item.create(
          name: 'Baião D+',
          value: 22.50,
          description: 'Deliciosa combinação nordestina de carne de sol, arroz moreninho, bacon, feijão fradinho, manteiga de garrafa, cebolinha, queijo coalho, tomate, pimenta de cheiro, pimenta biquinho e manjericão.'
        ),
        Item.create(
          name: 'Carreteiro',
          value: 21.00,
          description: 'Tradicional carreteiro gaúcho de charque bovino acompanhado de queijo muçarela, cebolinha, pimenta biquinho e manjericão.'
        ),
      ]
    ),

    Restaurant.create(
      name: 'Burguer King',
      code: 'bk1l2tzk',
      description: 'DESDE 1954 - 60 anos de tradição em carne grelhada no fogo como churrasco em cada pedido',
      color: 'red',
      items: [
        Item.create(
          name: 'MEGA STACKER CHEDDAR 2.0',
          value: 28.50,
          description: 'O Mega Stacker Cheddar voltou! Carne grelhada no fogo, bacon e muito queijo cheddar. Para encarar, não basta ter fome, tem que ter coragem! #PartiuBK  Imagem meramente ilustrativa.'
        ),
        Item.create(
          name: 'BALDE DE SORVETE',
          value: 12.00,
          description: 'O balde é o favorito de todos. Feito para compartilhar com todo mundo. Disponível nos sabores: Brownie, Chocotriplo, Ovomaltine®, Doce de Leite, Chocolate e Morango. Imagem meramente ilustrativa.'
        ),
      ]
    )
  ]
)

total_capacity = owner.usable_tables_count
owner.reservation_hours.each do |start_time|
  TimeSlot.create!(
    start_time: start_time,
    total_capacity: total_capacity,
    current_usage: 0,
    owner: owner
  )
end
