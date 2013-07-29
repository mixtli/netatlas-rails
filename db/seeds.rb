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
end
Authorization.current_user = admin


