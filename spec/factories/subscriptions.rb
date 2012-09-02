# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscription do
    group nil
    poller nil
    node nil
    state "MyString"
    severity "MyString"
  end
end
