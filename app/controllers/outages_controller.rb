class OutagesController < ResourceController
  self.resource_class = Outage
  self.datatable_class = OutagesDatatable
end
