class InterfacesDatatable < Datatable
  self.model = Interface
  self.columns = [:device, :ip_address, :state]
  self.default_scope = -> {Interface.includes(:device) }
  self.sort_columns = {
    :device => 'devices.hostname'
  }
  def row(interface)
    [
      interface.device ? link_to(interface.device.hostname, interface.device) : nil, 
      interface.ip_address.to_s,
      interface.state
    ]
  end
end
