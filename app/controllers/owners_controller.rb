class OwnersController < ApplicationController
  before_action :set_owner, only: %i[show edit update]
  before_action :set_owner_restaurant, only: %i[show_restaurant edit_restaurant]

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
    @restaurant = Restaurant.new
  end

  def time_slots
    @free_time_slots = FREE_TIME_SLOTS
  end

  private def set_owner
    @owner = Owner.first
  end

  private def owner_params
    params.require(:owner).permit(:name, :usable_tables_count, :reservations_start_time,
                                  :reservations_end_time)
  end

  private def set_owner_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
