class Order
  include Mongoid::Document

  field :time_slot, type: String
  field :item_ids, type: Array

  belongs_to :restaurant

  def item
    Item.find(id: self.item_ids[0])
  end
end
