class GraphItem < ActiveRecord::Base
  belongs_to :graph
  belongs_to :data_source
  attr_accessible :data_source_id, :graph_id, :options
end
