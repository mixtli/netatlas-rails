# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interface do
    ip_address "127.0.0.1" 
    hostname "MyString"
    if_speed 1
    if_type 1
    if_name "MyString"
    if_alias "MyString"
    if_descr "MyString"
    if_promiscuous false
    if_high_speed 1
    if_admin_status "MyString"
    #physical_address "MyString"
    mtu 1
    duplex "MyString"
  end
end
