require 'spec_helper'

describe PollersController do

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'index' do
    it "should return json" do
      10.times { create(:poller, :creator => @user)}
      get :index, :format => :json
      JSON.parse(response.body).size.should eql(10)
    end

    it "should filter on hostname" do
      5.times { create(:poller, :creator => @user)}
      2.times { create(:poller, :creator => @user, :hostname => 'foo.lvh.me') }
      get :index, :format => :json, :hostname => 'foo.lvh.me'
      JSON.parse(response.body).size.should eql(2)

    end
  end

  describe 'show' do
    it "should return json" do
      poller = create(:poller)
      get :show, :id => poller.id, :format => :json
      JSON.parse(response.body)['id'].should == poller.id
    end
  end

end
