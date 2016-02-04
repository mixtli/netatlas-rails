require 'spec_helper'

# These tests are intermittently failing apparently due to timing issues.  
# extra sleeps seem to help
describe "Devices List" do
  let(:user) { FactoryGirl.create(:user) }

  it "should redirect to login if not logged in" do
    visit devices_path
    page.should have_selector("#user_password")
  end

  describe "navigate to devices page as a user"  do
    before(:each) do
      sleep 1
      login_as(user)
      1.upto(25) do |n|
        create(:device,  :hostname => "host#{n}.lvh.me")
      end
      sleep 1
      visit devices_path
    end

    it "should get device listing", :truncate, :js do
      page.should have_content("host1.lvh.me")
    end

    it "should search devices", :truncate, :js do
      find('#devices_filter label input').set('host2')
      sleep 1
      page.should_not have_content('host1')
      page.should have_content('host2')
    end

    it "should page results correctly", :truncate, :js do
      pending "this test intermittently fails"
      all('tr').count.should be 11
      link = all('span a.fg-button')[2]
      link.click
      sleep 3
      #save_and_open_page
      save_and_open_page
      all('tr').count.should be 6
    end

    it "should go to device view when device clicked", :truncate => true, :js => true do 
      pending "test is bombing with spurious webkit error"
      click_link 'host1.lvh.me'
      page.should have_content('host1.lvh.me')
    end
  end
end
