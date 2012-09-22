class DataPoint < ActiveRecord::Base
  belongs_to :data_stream
  attr_accessible :created_at, :timestamp, :value, :data_stream_id
end
