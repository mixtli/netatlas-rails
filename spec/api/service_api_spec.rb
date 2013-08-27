require 'spec_helper'

describe NetAtlas::ServiceAPI do
  include Rack::Test::Methods
  def app
    NetAtlas::ServiceAPI
  end
  before do
    login_as_user
  end

  context 'list' do
    it "should get a list of services" do
      10.times { create(:service)}
      get '/services'
      response.size.should == 10
    end

    it "should paginate list" do
      10.times { |i| create(:service, :label => "service#{i}") }
      get '/services.json', :offset => 2, :limit => 3
      expect(last_response.status).to eq(200)
      expect(response.size).to eq(3)
      expect(response.first['service']['label']).to eq('service2')
    end

    it "should search services" do
      10.times { create(:service) }
      create(:service, :label  => 'blah')
      get '/services', :q => {:label_cont => 'blah'}
      expect(last_response.status).to eq(200)
      expect(response.size).to eq(1)
    end
  end
  context 'show' do
    it "should get a resource" do
      service = create(:service)
      get "/services/#{service.id}"
      response['service']['id'].should == service.id
    end

    it "should return 404 if record doesn't exist" do
      get '/services/1'
      expect(last_response.status).to eq(404)
    end
  end

  context "create" do
    it "should create a service" do
      post '/services', {:service => attributes_for(:service)}.to_json, {'CONTENT_TYPE' => "application/json"}
      expect(last_response.status).to be(201)
      expect(Service.count).to eq(1)
    end
  end

  context "update" do
    it "should update a service" do
      service = create(:service)
      put "/services/#{service.id}", {:service => {:label => 'foobar'}}.to_json, {'CONTENT_TYPE' => "application/json"}

      service.reload
      expect(service.label).to eq('foobar')
    end
  end
  context 'delete' do
    it "should delete a service" do
      service = create(:service)
      expect {
        delete "/services/#{service.id}"
      }.to change {Service.count }.by(-1)
    end
  end

  def response
    JSON.parse(last_response.body)
  end
end
