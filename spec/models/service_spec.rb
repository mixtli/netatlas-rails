require 'spec_helper'

describe Service do
  subject { build(:service)}
  it "should create a service" do
    subject.save.should be_true
  end
end
