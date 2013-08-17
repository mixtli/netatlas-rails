require 'spec_helper'

describe Subscription do
  subject { build(:subscription)}
  it "should require user" do
    subject.user_id = nil
    subject.should_not be_valid
    subject.errors[:user_id].should_not be_nil
  end
  it "should require user" do
    subject.event_filter_id = nil
    subject.should_not be_valid
    subject.errors[:event_filter_id].should_not be_nil
  end

end
