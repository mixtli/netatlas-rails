require 'spec_helper'

describe "Devices List" do
  let(:user) { FactoryGirl.create(:user) }

  it "should redirect to login if not logged in" do
    visit devices_path
    page.should have_selector("#user_password")
  end

  describe "navigate to devices page as a user"  do
    before(:each) do
      login_as(user)
      1.upto(25) do |n|
        FactoryGirl.create(:device,  :hostname => "host#{n}.lvh.me", :sys_contact => 'Bob')
      end
      visit devices_path
    end

    it "should get device listing", :js => true do
      page.should have_content("host1.lvh.me")
    end

    it "should search devices", :js => true do
      find('#devices_filter label input').set('host2')
      page.should_not have_content('host1')
      page.should have_content('host2')
    end

    it "should page results correctly", :js => true do
      #as_user(user) do
        all('tr').count.should be 11
        #save_and_open_page
        link = all('span a.fg-button')[2]
        link.click
        sleep 1
        #save_and_open_page
        all('tr').count.should be 6
      #end
    end

    it "should go to device view when device clicked", :js => true do 
      click_link 'host1.lvh.me'
      page.should have_content('host1.lvh.me')
      page.should have_content('Bob')
    end
  end
end
