class DataStream < ActiveRecord::Base
  belongs_to :data_source
  belongs_to :poller
  # attr_accessible :title, :body
end
