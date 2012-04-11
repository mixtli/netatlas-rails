class Device < Node
  acts_as_citier
  validates :hostname, :presence => true
  attr_accessible :auth_password, :auth_protocol, :community, :hostname, :ip_forwarding, :memory, :num_cpus, :os, :os_type, :os_vendor, :os_version, :priv_password, :priv_protocol, :snmp_version, :sys_contact, :sys_description, :sys_location, :sys_name

  before_create { |d| d.label ||= d.hostname }
  before_create { |d| d.state ||= "ok" }
end
