# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Poller.create!([
  { hostname: 'foo.lvh.me', queue_username: 'foo', queue_password: 'foo' }, 
  { hostname: 'bar.lvh.me', queue_username: 'bar', queue_password: 'bar' }
])

