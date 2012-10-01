# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :poller do
    hostname { |n| "poller#{n}.lvh.me" }
    port 8888
    state "unknown"
    association :creator, :factory => :user
    queue_username "MyString"
    queue_password "MyString"
  end
end
