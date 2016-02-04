require 'declarative_authorization/maintenance'
admin = nil

data_templates = [
  { 
    id: 1,
    name: 'HTTP Latency',
    plugin_id: 1,
    warning_threshold: 5,
    critical_threshold: 10,
    operator: '>',
    description: 'HTTP Latency'
  },
  { 
    id: 2,
    name: 'HTTP Response Time',
    plugin_id: 2,
    warning_threshold: 5,
    critical_threshold: 10,
    operator: '>',
    description: 'HTTP Response Time'
  },
  {
    id: 3,
    name: 'Inbound Traffic',
    plugin_id: 3,
    warning_threshold: 90,
    critical_threshold: 95,
    node_type: 'Interface',
    operator: '>',
    description: 'Inbound Traffic',
    arguments: {:oid => 'ifInOctets'}
  },
  {
    id: 4,
    name: 'Outbound Traffic',
    plugin_id: 3,
    warning_threshold: 90,
    critical_threshold: 95,
    node_type: 'Interface',
    operator: '>',
    description: 'Outbound Traffic',
    arguments: {:oid => 'ifOutOctets'}
  }
]
Authorization::Maintenance::without_access_control do
  DataTemplate.seed(:id, *data_templates)
end
Authorization.current_user = admin

