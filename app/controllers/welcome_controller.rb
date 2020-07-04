class WelcomeController < ApplicationController
  def index
    @owner = Owner.first
  end
end
