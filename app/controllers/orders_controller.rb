restaurants = [
  {
    name: "McDonalds",
    code: "123"
  },
  {
    name: "Biomundo",
    code: 456
  }
]

class OrdersController < ApplicationController
  def index
  end

  def check_code
    code = params[:code]

  end
end
