require 'spec_helper'

describe Notification do
  subject { build(:notification)}
  it "should have initial state pending" do
    subject.state.should == 'pending'
  end
end
