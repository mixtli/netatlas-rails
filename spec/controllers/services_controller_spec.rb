require 'spec_helper'

describe ServicesController do

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'index' do
    it "should return json" do
      10.times { create(:service, :creator => @user)}
      get :index, :format => :json
      JSON.parse(response.body).size.should eql(10)
    end
  end

  describe 'show' do
    it "should return json" do
      service = create(:service)
      get :show, :id => service.id, :format => :json
      JSON.parse(response.body)['id'].should == service.id
    end
  end

  describe 'create' do
    it "should create a service" do
      post :create, {:service => {:label => 'foo'}}
      Service.first.label.should eql('foo')
    end
  end

end