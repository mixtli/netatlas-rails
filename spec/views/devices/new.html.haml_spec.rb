require 'spec_helper'

describe "devices/new" do
  before(:each) do
    assign(:device, stub_model(Device,
      :hostname => "MyString",
      :ip_forwarding => false,
      :os => "MyString",
      :os_version => "MyString",
      :os_type => "MyString",
      :os_vendor => "MyString",
      :community => "MyString",
      :auth_protocol => "MyString",
      :auth_password => "MyString",
      :priv_protocol => "MyString",
      :priv_password => "MyString",
      :sys_name => "MyString",
      :sys_description => "MyString",
      :sys_contact => "MyString",
      :sys_location => "MyString",
      :memory => 1,
      :num_cpus => 1,
      :snmp_version => "MyString"
    ).as_new_record)
  end

  it "renders new device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => devices_path, :method => "post" do
      assert_select "input#device_hostname", :name => "device[hostname]"
      assert_select "input#device_ip_forwarding", :name => "device[ip_forwarding]"
      assert_select "input#device_os", :name => "device[os]"
      assert_select "input#device_os_version", :name => "device[os_version]"
      assert_select "input#device_os_type", :name => "device[os_type]"
      assert_select "input#device_os_vendor", :name => "device[os_vendor]"
      assert_select "input#device_community", :name => "device[community]"
      assert_select "input#device_auth_protocol", :name => "device[auth_protocol]"
      assert_select "input#device_auth_password", :name => "device[auth_password]"
      assert_select "input#device_priv_protocol", :name => "device[priv_protocol]"
      assert_select "input#device_priv_password", :name => "device[priv_password]"
      assert_select "input#device_sys_name", :name => "device[sys_name]"
      assert_select "input#device_sys_description", :name => "device[sys_description]"
      assert_select "input#device_sys_contact", :name => "device[sys_contact]"
      assert_select "input#device_sys_location", :name => "device[sys_location]"
      assert_select "input#device_memory", :name => "device[memory]"
      assert_select "input#device_num_cpus", :name => "device[num_cpus]"
      assert_select "input#device_snmp_version", :name => "device[snmp_version]"
    end
  end
end
