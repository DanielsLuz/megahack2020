class Order
  include Mongoid::Document

  field :time_slot, type: String
  field :item_ids, type: Array
  field :phone_number, type: String

  belongs_to :restaurant

  def item
    Item.find(id: self.item_ids[0])
  end
end
