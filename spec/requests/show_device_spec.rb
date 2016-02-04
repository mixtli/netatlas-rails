require 'spec_helper'
describe "Show a device" do
  let(:user) { FactoryGirl.create(:user) }
  let(:device) { FactoryGirl.create(:device, 
                                    hostname: 'test.lvh.me', 
                                    snmp_version: '2c',
                                   )}


  it "should redirect to login when not authenticated" do
    visit device_path(device)
    page.should have_selector('#user_password')
  end

  describe "As an authenticated user" do
    before(:each) do
      login_as(user)
      create(:interface )
      visit device_path(device)
    end


    it "should display host attributes" do
      page.should have_content('test.lvh.me')
      page.should have_content('2c')
    end

    it "should show interfaces"  do
      find('#interfaces thead' ).should have_content('IP Address')
      find('#interfaces tbody').should have_content('127.0.0.1')
    end
  end

end
