# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dependency do
    node nil
    dependent nil
  end
end
