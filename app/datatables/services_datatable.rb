class ServicesDatatable < Datatable
  self.model = Service
  self.columns = [:label, :device]
  self.default_scope = -> {Service.includes(:device)}
  self.sort_columns = {:device => 'devices.hostname'}
  def row(service)
    [link_to(service.label, service), link_to(service.device.hostname, service.device)]
  end
end
