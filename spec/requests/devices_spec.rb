require 'spec_helper'

describe "Devices" do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET /devices"  do
    it "should get device listing", :js => true do
      as_user(user) do 
        FactoryGirl.create(:device)
        visit devices_path
        #binding.pry
        page.should have_content("MyString")
      end
    end
  end
end
