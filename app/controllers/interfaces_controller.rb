class InterfacesController < NodesController
  self.resource_class = Interface
  self.datatable_class = InterfacesDatatable
  filter_access_to :datatable, :require => :read
end

