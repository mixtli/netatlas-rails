# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
  end

  factory :email_contact, :parent => :contact, :class => Contact::Email do
    type "Contact::Email"
    email "user@example.com"
  end

  factory :postback_contact, :parent => :contact, :class => Contact::Postback do
    type "Contact::Postback"
    url "http://lvh.me"
  end
end
