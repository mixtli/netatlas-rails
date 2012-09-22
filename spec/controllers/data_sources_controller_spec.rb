require 'spec_helper'

describe DataSourcesController do
  include EventedSpec::SpecHelper
  # This should return the minimal set of attributes required to create a valid
  # Device. As you add validations to Device, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { state: 'ok', hostname: 'foo.lvh.me'}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DevicesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe 'index' do
    it "should return json" do
      10.times { create(:data_source, :creator => @user)}
      get :index, :format => :json
      JSON.parse(response.body).size.should eql(10)
    end
  end

  describe 'show' do
    it "should return json" do
      ds = create(:data_source)
      get :show, :id => ds.id, :format => :json
      JSON.parse(response.body)['id'].should == ds.id
    end
  end

end