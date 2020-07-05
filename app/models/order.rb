class Order
  include Mongoid::Document

  field :time_slot_id, type: String
  field :item_ids, type: Array
  field :phone_number, type: String
  field :completed, type: Boolean, default: false

  belongs_to :restaurant

  def item
    Item.find(id: item_ids[0])
  end

  def time_slot
    TimeSlot.find(id: time_slot_id)
  end
end
