# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    label Faker::Lorem.words(1)
  end
end
