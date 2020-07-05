class OwnersController < ApplicationController
  before_action :set_owner, only: %i[show edit update create_restaurant edit_restaurant
                                  update_restaurant destroy_restaurant]
  before_action :set_restaurant, only: %i[show_restaurant edit_restaurant update_restaurant
                                  destroy_restaurant]

  def show
  end

  def edit
  end

  def update
    if @owner.update(owner_params)
      redirect_to owner_path(@owner), notice: 'Perfil atualizado com sucesso'
    else
      render :edit
    end
  end

  def show_restaurant
  end

  def edit_restaurant
  end

  def new_restaurant
    @owner = Owner.find(params[:owner_id])
    @restaurant = Restaurant.new
  end

  def create_restaurant
    restaurant = Restaurant.new(restaurant_params.merge(owner: @owner))

    if restaurant.save
      redirect_to owner_path(@owner), notice: 'Restaurante adicionado com sucesso'
    else
      render :new_restaurant
    end
  end

  def update_restaurant
    if @restaurant.update(restaurant_params)
      redirect_to(
        owner_restaurant_path(owner_id: @owner.id, id: @restaurant.id),
        notice: 'Restaurante atualizado com sucesso'
      )
    else
      render :edit
    end
  end

  def destroy_restaurant
    @restaurant.destroy
    redirect_to owner_path(@owner), notice: 'Restaurante removido com sucesso'
  end

  def time_slots
    @free_time_slots = FREE_TIME_SLOTS
  end

  private def set_owner
    @owner = Owner.find(params[:owner_id] || params[:id])
  end

  private def owner_params
    params.require(:owner).permit(:name, :usable_tables_count, :reservations_start_time,
                                  :reservations_end_time)
  end

  private def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  private def restaurant_params
    params.require(:restaurant).permit(:name, :code, :description, :color)
  end
end
