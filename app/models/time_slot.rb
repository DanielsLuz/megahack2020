class TimeSlot
  include Mongoid::Document
  include Mongoid::Timestamps

  DEFAULT_DURATION = 30.minutes

  field :start_time, type: ActiveSupport::TimeWithZone
  field :duration, type: ActiveSupport::Duration, default: DEFAULT_DURATION
  field :total_capacity, type: Integer
  field :current_usage, type: Integer

  belongs_to :owner

  def to_s
    start_time.strftime('%H:%M')
  end

  def available?
    current_usage < total_capacity
  end

  def available_tables_count
    total_capacity - current_usage
  end
end
