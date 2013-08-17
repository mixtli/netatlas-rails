# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :node do
    label "Node Label"
    description "Node Description"
    state "ok"
    device  
    snmp_index 1
  end
end
