# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interface do
    ip_address "127.0.0.1" 
    hostname "MyString"
    state { %w(ok warning critical unknown)[rand(4)] }
    speed 100000000
    if_type 1
    #physical_address "MyString"
    mtu 1
    duplex "MyString"
  end
end
