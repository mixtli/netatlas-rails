require 'declarative_authorization/maintenance'
admin = nil

plugins = [
  { 
    id: 1,
    name: 'HTTP',
    class_name: 'HTTP'
  },
  { 
    id: 2,
    name: 'Ping',
    class_name: 'Ping'
  },
  {
    id: 3,
    name: 'SNMP',
    class_name: 'SNMP'
  },
  {
    id: 4,
    name: 'Nagios',
    class_name: 'Nagios'
  }
]
Authorization::Maintenance::without_access_control do
  Plugin.seed(:name, *plugins)
end

