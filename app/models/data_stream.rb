class DataStream < ActiveRecord::Base
  belongs_to :data_source
  belongs_to :poller
  has_many :data_points
end
