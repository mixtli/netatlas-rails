# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_template do
    name "MyString"
    plugin nil
    interval 60
    warning_threshold 95
    critical_threshold 99
    operator ">"
    description "Lorem Ipsum"
    arguments {}
  end
end
