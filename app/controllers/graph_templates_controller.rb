class GraphTemplatesController < ResourceController
  self.resource_class = GraphTemplate
  self.datatable_class = GraphTemplatesDatatable
  respond_to :html, :json
end
