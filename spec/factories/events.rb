FactoryGirl.define do
  factory :event do
    node
    state :open
    severity :critical
  end
end
