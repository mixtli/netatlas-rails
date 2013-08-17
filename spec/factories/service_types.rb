# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service_type do
    name "MyString"
    default_port 1
    default_template nil
    description "MyText"
  end
end
