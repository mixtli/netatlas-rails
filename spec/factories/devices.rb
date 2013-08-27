# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    hostname { Faker::Internet.domain_word + ".lvh.me" }
    state { %w(ok warning critical unknown)[rand(4)] }
    community "MyString"
    auth_protocol "MyString"
    auth_password "MyString"
    priv_protocol "MyString"
    priv_password "MyString"
  end
end
