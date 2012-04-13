require 'spec_helper'

describe "Show a device" do
  let(:user) { FactoryGirl.create(:user) }
  let(:device) { FactoryGirl.create(:device, :hostname => 'test.lvh.me')}


  it "should redirect to login when not authenticated" do
    visit device_path(device)
    page.should have_selector('#user_password')
  end

  describe "As an authenticated user" do
    before(:each) do
      login_as(user)
      visit device_path(device)
    end

    it "should display hostname" do
      page.should have_content('test.lvh.me')
    end
  end

end
