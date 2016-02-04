# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#
#   XXX:  Don't use this file.  we're using seed_fu
require 'declarative_authorization/maintenance'
if User.where(:email => 'admin@netatlas.com').first
  puts "Database already seeded"
  exit 0
end

admin = nil
Authorization::Maintenance::without_access_control do
end
Authorization.current_user = admin


