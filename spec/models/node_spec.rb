require 'spec_helper'

describe Node do
  let(:node) { FactoryGirl.build(:node) }
  it "should not accept invalid state" do
    node.state = "fjdsaf"
    node.should_not be_valid
  end

  it "should accept valid state" do
    node.state = "warning"
    node.should be_valid
  end

end
