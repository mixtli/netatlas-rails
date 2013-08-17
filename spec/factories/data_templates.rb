# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_template do
    name "MyString"
    plugin nil
    interval 1
    warning_threshold 1.5
    critical_threshold 1.5
    operator "MyString"
    description "MyText"
    arguments nil
  end
end
