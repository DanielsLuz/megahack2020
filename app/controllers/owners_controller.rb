class OwnersController < ApplicationController
  FREE_TIME_SLOTS = ['10:00','11:00','11:30','13:00','13:30','17:00']

  def index
  end

  def create
  end

  def tables_create
  end

  def time_slots
    @free_time_slots = FREE_TIME_SLOTS
  end
end
