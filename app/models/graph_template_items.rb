class GraphTemplateItems < ActiveRecord::Base
  belongs_to :graph_template
  belongs_to :data_template
end
