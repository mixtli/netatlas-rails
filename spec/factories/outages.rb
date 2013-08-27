# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :outage do
    node nil
    start_time "2013-08-20 21:52:28"
    end_time "2013-08-20 21:52:28"
    description "MyText"
  end
end
