require 'spec_helper'

describe "Devices" do
  let(:user) { FactoryGirl.create(:user) }
  describe "GET /devices" do
    it "should get device listing", :js => true  do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      as_user(user) do 
        visit devices_path
        page.should have_content("Listing devices")
        #response.status.should be(200)
      end
    end
  end
end
