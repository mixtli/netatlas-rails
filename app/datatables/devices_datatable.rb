class DevicesDatatable < Datatable
  self.model = Device
  self.columns = [:hostname, :sys_name, :sys_descr]
  self.default_scope = Device
  def row(device)
    [link_to(device.hostname, device), device.sys_name, device.sys_descr]
  end
end
