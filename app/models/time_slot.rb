class TimeSlot
  include Mongoid::Document

  DEFAULT_DURATION = 30.minutes

  field :start_time, type: Time
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
end
