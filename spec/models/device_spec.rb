require 'spec_helper'

describe Device do
  it "should create a device" do
    device = Device.create!(:hostname => 'foo.lvh.me', :state => 'ok')
    device.should_not be_new_record
  end

  it "should automatically set ip address from hostname" do
    device = Device.create!(:hostname => 'foo.lvh.me', :state => 'ok')
    device.ip_address.should eql IPAddr.new('127.0.0.1')
  end

  it "should not create with invalid hostname" do
    device = Device.create(:hostname => 'fakename.doesntexist')
    device.should_not be_valid
  end

end
