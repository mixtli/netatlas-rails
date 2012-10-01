class NodesController < ResourceController
  filter_resource_access
  respond_to :html, :json, :xml
  self.resource_class = Node
end
