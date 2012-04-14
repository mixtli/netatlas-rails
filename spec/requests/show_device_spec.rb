require 'spec_helper'
describe "Show a device" do
  let(:user) { FactoryGirl.create(:user) }
  let(:device) { FactoryGirl.create(:device, 
                                    hostname: 'test.lvh.me', 
                                    sys_descr: 'Darwin localhost', 
                                    sys_name: 'localhost', 
                                    sys_objectid: '.1.3.6.1', 
                                    sys_location: 'Test Lab',
                                    sys_contact: 'Bill',
                                    snmp_version: '2c',
                                    memory: 4000

                                   )}


  it "should redirect to login when not authenticated" do
    visit device_path(device)
    page.should have_selector('#user_password')
  end

  describe "As an authenticated user" do
    before(:each) do
      login_as(user)
      create(:interface, :device => device, :ip_address => '127.0.0.1')
      visit device_path(device)
    end

    it "should display snnp attributes" do
      #pending
      #save_and_open_page
      page.should have_content('Darwin')
      page.should have_content('.1.3.6.1')
      page.should have_content('localhost')
      page.should have_content('Test Lab')
      page.should have_content('Bill')
    end

    it "should display host attributes" do
      page.should have_content('test.lvh.me')
      page.should have_content('4000')
      page.should have_content('2c')
    end

    it "should show interfaces"  do
      find('#interfaces thead' ).should have_content('IP Address')
      find('#interfaces thead').should have_content('Netmask')
      find('#interfaces tbody').should have_content('127.0.0.1')
    end
  end

end
