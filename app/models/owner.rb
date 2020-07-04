TIME_FRAME = 30 * 60.seconds

class Owner
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :usable_tables_count, type: Integer
  field :reservations_start_time, type: String
  field :reservations_end_time, type: String

  has_many :restaurants, dependent: :destroy


  # Help Rodriguinho find better names to the next 3 methods
  def time_range
    (Time.parse(reservations_end_time) - Time.parse(reservations_start_time)) / TIME_FRAME
  end

  def date_slots
    (0..(time_range.to_i - 1)).to_a.map { |n| Time.parse(reservations_start_time) + (TIME_FRAME * n) }
  end

  def time_slots
    date_slots.map { |d| d.strftime("%H:%M") }
  end
end
