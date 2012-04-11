# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    hostname "MyString"
    ip_forwarding false
    os "MyString"
    os_version "MyString"
    os_type "MyString"
    os_vendor "MyString"
    community "MyString"
    auth_protocol "MyString"
    auth_password "MyString"
    priv_protocol "MyString"
    priv_password "MyString"
    sys_name "MyString"
    sys_description "MyString"
    sys_contact "MyString"
    sys_location "MyString"
    memory 1
    num_cpus 1
    snmp_version "MyString"
  end
end
