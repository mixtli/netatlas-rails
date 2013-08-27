require 'spec_helper'

describe NetAtlas::DeviceAPI do
  include Rack::Test::Methods
  def app
    NetAtlas::DeviceAPI
  end
  before do
    login_as_user
  end

  context 'list' do
    it "should get a list of devices" do
      10.times { create(:device)}
      get '/devices'
      response.size.should == 10
    end


    it "should paginate list" do
      10.times { |i| create(:device, :hostname => "host#{i}.lvh.me") }
      get '/devices.json', :offset => 2, :limit => 3
      expect(last_response.status).to eq(200)
      expect(response.size).to eq(3)
      expect(response.first['device']['hostname']).to eq('host2.lvh.me')
    end

    it "should search devices" do
      10.times { create(:device) }
      create(:device, :hostname => 'blah.lvh.me')
      get '/devices', :q => {:hostname_cont => 'blah'}
      expect(last_response.status).to eq(200)
      expect(response.size).to eq(1)
    end
  end
  context 'show' do
    it "should get a resource" do
      device = create(:device)
      get "/devices/#{device.id}"
      response['device']['id'].should == device.id
    end

    it "should return 404 if record doesn't exist" do
      get '/devices/1'
      expect(last_response.status).to eq(404)
    end
  end

  context "create" do
    it "should create a device" do
      post '/devices', {:device => attributes_for(:device)}.to_json, {'CONTENT_TYPE' => "application/json"}
      expect(last_response.status).to be(201)
      expect(Device.count).to eq(1)
    end

    it "should set the creator" do
      post '/devices', {:device => attributes_for(:device)}.to_json, {'CONTENT_TYPE' => "application/json"}
      expect(last_response.status).to be(201)
      expect(Device.last.creator.email).to eql('user@netatlas.com')
    end
  end

  context "update" do
    it "should update a device" do
      device = create(:device)
      put "/devices/#{device.id}", {:device => {:hostname => 'foobar.lvh.me'}}.to_json, {'CONTENT_TYPE' => "application/json"}
      device.reload
      expect(device.hostname).to eq('foobar.lvh.me')
    end
  end
  context 'delete' do
    it "should delete a device" do
      device = create(:device)
      expect {
        delete "/devices/#{device.id}"
      }.to change {Device.count }.by(-1)
    end
  end

  def response
    JSON.parse(last_response.body)
  end
end
