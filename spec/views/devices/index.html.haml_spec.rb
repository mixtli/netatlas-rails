require 'spec_helper'

describe "devices/index" do
  before(:each) do
    assign(:devices, [
      stub_model(Device,
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
      ),
      stub_model(Device,
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
      )
    ])
  end

  it "renders a list of devices" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hostname".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Os".to_s, :count => 2
    assert_select "tr>td", :text => "Os Version".to_s, :count => 2
    assert_select "tr>td", :text => "Os Type".to_s, :count => 2
    assert_select "tr>td", :text => "Os Vendor".to_s, :count => 2
    assert_select "tr>td", :text => "Community".to_s, :count => 2
    assert_select "tr>td", :text => "Auth Protocol".to_s, :count => 2
    assert_select "tr>td", :text => "Auth Password".to_s, :count => 2
    assert_select "tr>td", :text => "Priv Protocol".to_s, :count => 2
    assert_select "tr>td", :text => "Priv Password".to_s, :count => 2
    assert_select "tr>td", :text => "Sys Name".to_s, :count => 2
    assert_select "tr>td", :text => "Sys Description".to_s, :count => 2
    assert_select "tr>td", :text => "Sys Contact".to_s, :count => 2
    assert_select "tr>td", :text => "Sys Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Snmp Version".to_s, :count => 2
  end
end
