require 'spec_helper'

describe "Services List" do
  let(:user) { FactoryGirl.create(:user) }

  it "should redirect to login if not logged in" do
    visit services_path
    save_and_open_page
    page.should have_selector("#user_password")
  end

  describe "navigate to services page as a user"  do
    before(:each) do
      login_as(user)
      1.upto(25) do |n|
        create(:service, :label => "ServiceName #{n}")
      end
      visit services_path
    end

    it "should create a service" do
      device = create(:device)
      create(:service_type, :name => 'HTTP')
      click_link 'Create a Service'
      fill_in 'Label', :with => 'Foo'
      select 'HTTP', :from => 'Service type'
      select device.hostname, :from => 'Device'
      click_button 'Create'
      page.should have_content('successfully created')
    end

    it "should add a data source to a service" do
      create(:data_template, :name => 'HTTP Latency', :plugin => create(:plugin))
      poller = create(:poller, :hostname => 'poller1', :creator => create(:user))
      service = create(:service, :label => 'HTTP Latency for host', :service_type => create(:service_type, :name => 'HTTP'))
      visit service_path(service)
      click_link 'Create Data Source'
      select 'HTTP Latency', :from => 'data_source_data_template_id'
      select 'poller1', :from => 'Pollers'
      # XXX: I don't understand why I have to mock this.  It should be set by bunny.rb initializer
      # but for some reason ::BUNNY is nil here
      ::BUNNY = stub(:queue => nil, :exchange => stub(:publish => nil))
      click_button 'Create'
      save_and_open_page
      page.should have_content('successfully created')
      DataSource.count.should == 1
      DataSource.first.data_streams.count.should == 1
      DataSource.first.pollers.count.should == 1
    end

    it "should get service listing", :js, :truncate do
      page.should have_content("ServiceName")
    end

    it "should go to service view when service clicked", :js, :truncate do 
      sleep 1
      page.first(:link, 'Show').click
      page.should have_content('ServiceName 1')
    end
  end
end
