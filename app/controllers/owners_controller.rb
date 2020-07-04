class OwnersController < ApplicationController
  before_action :set_owner, only: %i[show edit update]
  before_action :set_owner_restaurant, only: %i[show_restaurant]

  FREE_TIME_SLOTS = ['10:00','11:00','11:30','13:00','13:30','17:00'].freeze

  def show
  end

  def edit
  end

  def update
    redirect_to owner_path(@owner)
  end

  def show_restaurant
  end

  def time_slots
    @free_time_slots = FREE_TIME_SLOTS
  end

  private def set_owner
    @owner = Owner.first
  end

  private def set_owner_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
