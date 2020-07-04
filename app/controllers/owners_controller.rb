class OwnersController < ApplicationController
  before_action :set_owner, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    redirect_to owner_path(@owner)
  end

  private def set_owner
    @owner = Owner.first
  end
end
