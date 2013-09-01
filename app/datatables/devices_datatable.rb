class DevicesDatatable < Datatable
  self.model = Device
  self.columns = [:hostname, :state]
  self.default_scope = Device
  def row(device)
    [link_to(device.hostname, device), device.state]
  end
end
