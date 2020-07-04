class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :code, type: Integer
  field :description, type: String
  field :color, type: String

  has_many :items, dependent: :destroy
  belongs_to :owner
end
