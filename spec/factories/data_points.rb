# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_point do
    data_stream nil
    timestamp "2012-09-20 00:13:52"
    created_at "2012-09-20 00:13:52"
    value 1.5
  end
end
