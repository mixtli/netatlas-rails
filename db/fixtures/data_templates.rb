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
  }
]
Authorization::Maintenance::without_access_control do
  DataTemplate.seed(:name, *data_templates)
end
Authorization.current_user = admin

