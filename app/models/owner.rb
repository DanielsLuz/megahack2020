class Owner
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :usable_tables_count, type: Integer
  field :reservations_start_time, type: String
  field :reservations_end_time, type: String

  has_many :restaurants, dependent: :destroy
end
