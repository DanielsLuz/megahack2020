class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :value, type: Integer
  field :description, type: String

  belongs_to :restaurant
end
