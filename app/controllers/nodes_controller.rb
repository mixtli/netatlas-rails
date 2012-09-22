class NodesController < ResourceController
  before_filter :authenticate_user!
  filter_resource_access
  respond_to :html, :json, :xml
  self.resource_class = Node
end
