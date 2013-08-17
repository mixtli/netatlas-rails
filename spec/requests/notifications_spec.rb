require 'spec_helper'

describe "Notifications List" do
  let(:user) { FactoryGirl.create(:user) }

  it "should redirect to login if not logged in" do
    visit notifications_path
    page.should have_selector("#user_password")
  end

  describe "navigate to notifications page as a user"  do
    before(:each) do
      login_as(user)
      1.upto(25) do |n|
        create(:notification, :event => create(:event, :description => "an event #{n}"))
      end
      visit notifications_path
    end

    it "should get notification listing" do
      page.body.scan(/an event/).size.should == 10
      page.body.scan("user@example.com").size.should == 10
    end

    it "should go to show view when notification clicked" do 
      page.first(:link, "Show").click
      page.should have_content('an event 1')
    end
  end
end
