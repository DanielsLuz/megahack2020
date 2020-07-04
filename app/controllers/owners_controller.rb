class OwnersController < ApplicationController
  before_action :set_owner, only: %i[show edit update]

  OWNER_MOCKUP = {
    name: 'Shawee Shopping',
    restaurants: [
      { name: 'Mc Donalds', access_code: 'mc123' },
      { name: 'Bio Mundo', access_code: 'biomundo50' },
      { name: 'Panelinhas', access_code: 'panelas_dudu2020' }
    ],
    usable_tables_count: 15,
    reservations_start_time: '08:00',
    reservations_end_time: '20:00'
  }.freeze

  FREE_TIME_SLOTS = ['10:00','11:00','11:30','13:00','13:30','17:00'].freeze

  def show
  end

  def edit
  end

  def update
    redirect_to '/owners/1'
  end

  private def set_owner
    @owner = OWNER_MOCKUP
  end

  def time_slots
    @free_time_slots = FREE_TIME_SLOTS
  end
end
