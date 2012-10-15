require 'declarative_authorization/maintenance'

service_types = [
  { 
    id: 1,
    name: 'HTTP',
    description: 'HTTP'
  }
]

Authorization::Maintenance::without_access_control do
  ServiceType.seed(:name, *service_types)
end


