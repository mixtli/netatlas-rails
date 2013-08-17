require 'spec_helper'

describe "Create a device" do
  it "should redirect to login if not logged in" do
    visit new_device_path
    page.should have_selector("#user_password")
  end

  describe "as a user" do
    it "should allow me to navigate to device create page" do
      as_user(FactoryGirl.create(:user)) do
        visit root_path
        click_link 'Devices'
        click_link 'Create a Device'
        page.should have_selector("#device_hostname")
      end
    end
    it "should create a new device" do
      as_user(FactoryGirl.create(:user)) do
        visit new_device_path
        fill_in 'device_hostname', with: 'foo.lvh.me'
        click_on 'create_device'
        Device.first.ip_address.should eql IPAddr.new('127.0.0.1')
      end
    end
  end
end
