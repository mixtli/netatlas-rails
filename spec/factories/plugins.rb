# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :plugin do
    name { ["SNMP", "Nagios"][rand(2)]}
    class_name { |p| p.name }
  end
end
