class Restaurant
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :code, type: String
  field :description, type: String
  field :color, type: String

  has_many :items, dependent: :destroy
  belongs_to :owner
end
