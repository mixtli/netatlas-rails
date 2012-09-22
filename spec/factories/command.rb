

FactoryGirl.define do
  factory :command do
    state :pending
    poller
    name :scan
  end
end
