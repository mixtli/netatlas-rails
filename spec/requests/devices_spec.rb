require 'spec_helper'

describe "Devices" do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET /devices" do
    it "should get device listing", :js => true  do
      as_user(user) do 
        visit devices_path
        page.should have_content("Listing devices")
      end
    end
  end
end
