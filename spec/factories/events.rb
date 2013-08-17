FactoryGirl.define do
  factory :event do
    state :open
    severity :critical
  end

  factory :discovery_event, :parent => :event, :class => Event::Discovery do
    type 'Event::Discovery'
  end
end
