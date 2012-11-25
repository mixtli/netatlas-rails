# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    event 
    contact { build(:email_contact)}
    event_filter nil
  end
end
