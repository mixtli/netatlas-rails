# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'declarative_authorization/maintenance'

admin = nil
Authorization::Maintenance::without_access_control do
  admin = User.create(:email => 'admin@netatlas.com', :password => 'password', :password_confirmation => 'password')
  admin.update_attribute(:admin, true)


  snmp_plugin = Plugin.create(:name => 'SNMP', :class_name => 'SNMP')
  nagios_plugin = Plugin.create(:name => 'Nagios', :class_name => 'Nagios')
  ping_plugin = Plugin.create(:name => 'Ping', :class_name => 'Ping')

  DataTemplate.create(:plugin_id => snmp_plugin.id, :node_type => 'Interface', :name => 'ifInOctets', :interval => 60, :warning_threshold => 90, :critical_threshold => 95, :operator => ">", :arguments => {:oid => 'ifInOctets'} )

end
Authorization.current_user = admin


