# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_source do
    node 
    plugin 
    data_template nil
    state "MyString"
    last_polled_at "2012-06-26 00:33:43"
    interval 60
    description "MyText"
    warning_threshold 90
    critical_threshold 99
    operator ">"
    arguments {}
    varbinds {}
  end
end
