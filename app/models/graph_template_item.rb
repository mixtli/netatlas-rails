class GraphTemplateItem < ActiveRecord::Base
  attr_accessible :graph_template_id, :data_template_id, :cdef, :units, :label, :options
  belongs_to :graph_template
  belongs_to :data_template
end
