require 'spec_helper'

describe Event::Discovery do
  subject { create(:discovery_event ) }

  it "should set snmp attributes" do
    subject.arguments = {'type' => 'device', 'hostname' => 'lvh.me', 'snmp_attributes' => {'a' => '1', 'b' => '2'}}
    subject.process!
    subject.node.snmp_attributes.should eql(subject.arguments['snmp_attributes'])
  end

  it "should set snmp attributes on device that already exists" do
    device = create(:device)
    subject.arguments = {'type' => 'device', 'hostname' => device.hostname, 'snmp_attributes' => {'a' => 'b'} }
    subject.process!
    subject.node_id.should == device.id
    subject.node.snmp_attributes.should == {'a' => 'b'}
  end

  it "should not create a node if it doesn't have minimum set of unique keys" do
    device = create(:device)
    subject.arguments = {'type' => 'device', 'snmp_attributes' => {'a' => 'b'}}
    expect {
      subject.process!
    }.to raise_error(ActiveRecord::RecordInvalid)
    subject.node_id.should be_nil
  end
end
