class Owner
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :usable_tables_count, type: Integer
  field :reservations_start_time, type: String
  field :reservations_end_time, type: String

  has_many :restaurants, dependent: :destroy
  has_many :time_slots

  def opening_time
    Time.parse(reservations_start_time)
  end

  def closing_time
    Time.parse(reservations_end_time)
  end

  def slots_quantity
    (closing_time - opening_time) / TimeSlot::DEFAULT_DURATION
  end

  def reservation_hours
    (0...slots_quantity)
      .map { |index| opening_time + (TimeSlot::DEFAULT_DURATION * index) }
      .map { |date| date.strftime('%H:%M') }
  end
end
