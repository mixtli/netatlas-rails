class ServicesController < NodesController
  filter_access_to :datatable, :require => :read
  self.resource_class = Service 
  self.datatable_class = ServicesDatatable
end
