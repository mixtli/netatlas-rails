require 'spec_helper'

describe Poller do
  let(:poller) { create(:poller) }

  it "should not allow invalid state" do
    poller.state = "fasf"
    poller.should_not be_valid
  end

  it "should allow valid state" do
    poller.state = "up"
    poller.should be_valid
  end
end
