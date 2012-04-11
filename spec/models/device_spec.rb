require 'spec_helper'

describe Device do
  it "should create a device" do
    device = Device.create!(:hostname => 'foo.lvh.me', :state => 'ok')
    device.should_not be_new_record
    
  end
end
