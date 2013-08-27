# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :service do
    label { Faker::Lorem.words(2).join(" ") }
    device
    state { %w(ok warning critical unknown)[rand(4)] }
    description { Faker::Lorem.words(10).join(" ")}
  end
end
