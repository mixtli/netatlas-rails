require 'spec_helper'

describe Network do
  it "should create a network" do
    subject.address = '99.99.99.0/24'
    subject.save!
    subject.address.should be_kind_of(IPAddr)
  end

  it "should search for an address" do
    %w(99.99.99.0/24 88.88.88.0/24 77.77.77.0/24).each do |ip|
      create(:network, :address => ip)
    end
    Network.where("? << address", '88.88.88.1').size.should eql(1)
    network = Network.where("? << address", '88.88.88.1').first
    network.address.should eql(IPAddr.new('88.88.88.0/24'))
  end
end
