require 'spec_helper'

describe "devices/show" do
  before(:each) do
    @device = assign(:device, stub_model(Device,
      :hostname => "Hostname",
      :ip_forwarding => false,
      :os => "Os",
      :os_version => "Os Version",
      :os_type => "Os Type",
      :os_vendor => "Os Vendor",
      :community => "Community",
      :auth_protocol => "Auth Protocol",
      :auth_password => "Auth Password",
      :priv_protocol => "Priv Protocol",
      :priv_password => "Priv Password",
      :sys_name => "Sys Name",
      :sys_description => "Sys Description",
      :sys_contact => "Sys Contact",
      :sys_location => "Sys Location",
      :memory => 1,
      :num_cpus => 2,
      :snmp_version => "Snmp Version"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hostname/)
    rendered.should match(/false/)
    rendered.should match(/Os/)
    rendered.should match(/Os Version/)
    rendered.should match(/Os Type/)
    rendered.should match(/Os Vendor/)
    rendered.should match(/Community/)
    rendered.should match(/Auth Protocol/)
    rendered.should match(/Auth Password/)
    rendered.should match(/Priv Protocol/)
    rendered.should match(/Priv Password/)
    rendered.should match(/Sys Name/)
    rendered.should match(/Sys Description/)
    rendered.should match(/Sys Contact/)
    rendered.should match(/Sys Location/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Snmp Version/)
  end
end
