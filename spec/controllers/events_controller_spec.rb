require 'spec_helper'

describe EventsController do
  render_views

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'index' do
    it "should return json" do
      10.times { create(:event, :creator => @user)}
      get :index, :format => :json
      JSON.parse(response.body).size.should eql(10)
    end
    it "should render" do
      10.times { create(:event, :severity => 'warning', :creator => @user, :node => create(:node, :label => 'MyNode'))}
      get :index
      response.body.scan(/MyNode/).size.should == 10
    end
  end

  describe 'show' do
    it "should return json" do
      event = create(:event)
      get :show, :id => event.id, :format => :json
      JSON.parse(response.body)['id'].should == event.id
    end
  end

  describe 'create' do
    it "should create a event" do
      post :create, {:event => {:description=> 'foo'}}
      Event.first.description.should eql('foo')
    end
  end

end
