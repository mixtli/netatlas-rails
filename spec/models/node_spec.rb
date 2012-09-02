require 'spec_helper'

describe Node do
  let(:node) { FactoryGirl.create(:node) }
  it "should not accept invalid state" do
    node.state = "fjdsaf"
    node.should_not be_valid
  end

  it "should accept valid state" do
    node.state = "warning"
    node.should be_valid
  end

  it "should set dependencies" do
    node.dependencies << FactoryGirl.create(:node)
    node.dependencies.size.should eql(1)
  end

  it "should set dependents" do
    node.dependents << FactoryGirl.create(:node)
    node.dependents.size.should eql(1)
  end

  it "should not mix dependents and dependencies" do
    2.times { node.dependencies << FactoryGirl.create(:node)}
    3.times { node.dependents << FactoryGirl.create(:node)}
    node.save!
    node.dependencies.size.should eql(2)
    node.dependents.size.should eql(3)
  end

  it "should retreive all dependents" do
    5.times { FactoryGirl.create(:node)} #these shouldn't be in result
    3.times do 
      node.dependents << FactoryGirl.create(:node) 
    end
    node.dependents.each do |d|
      3.times { d.dependents << FactoryGirl.create(:node) }
    end
    node.all_dependents.size.should eql(12)
  end

  it "should retreive all dependencies" do
    5.times { FactoryGirl.create(:node)}
    3.times do
      node.dependencies << FactoryGirl.create(:node)
    end
    node.dependencies.each do |d|
      3.times { d.dependencies << FactoryGirl.create(:node)}
    end
    node.all_dependencies.size.should eql(12)
  end


end
