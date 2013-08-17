require 'spec_helper'

describe EventFilter do
  subject { create(:event_filter, :group_ids => [create(:group).id], :node_ids => [create(:node).id])}

  it "should have nil group_ids on creation" do
    filter = described_class.create
    filter.group_ids.should be_nil
  end

  it "should return empty array for groups" do
    filter = described_class.create
    filter.groups.should_not be_nil
    filter.groups.should be_empty
  end

  it "#groups" do
    subject.groups.count.should == 1
  end

  it "#add_group" do
    subject.add_group(group = create(:group)).should be_true
    subject.groups.should include(group)
    subject.groups.size.should == 2
  end
  it "#nodes" do
    subject.nodes.size.should == 1
  end
  it "#add_node" do
    subject.add_node(node = create(:node)).should be_true
    subject.nodes.should include(node)
    subject.nodes.size.should == 2
  end

  context "has groups" do
    let(:group) { create(:group)}
    subject { described_class.create(:group_ids => [group.id], :node_ids => nil)}
    specify "#events" do
      group.nodes << node = create(:node)
      create(:event)
      2.times { create(:event, :node => node)}
      subject.events.size.should == 2
    end
  end

  context "has severities" do
    subject { described_class.create :severities => ['warning', 'critical']}
    specify "#events" do
      create(:event, :severity => 'ok')
      create(:event, :severity => 'critical')
      create(:event, :severity => 'warning')
      subject.events.count.should == 2
    end
  end

  context "has states" do
    subject { described_class.create :states => ['open', 'resolved'] }
    specify "#events" do
      create(:event, :state => 'open')
      create(:event, :state => 'acknowledged')
      create(:event, :state => 'resolved')
      subject.events.count.should == 2
    end
  end

  context "has types" do
    subject {described_class.create :types => ['discovery']}
    specify "#events" do
      Event.create!
      Event::Discovery.create!
      subject.events.count.should == 1
    end
  end

  context "has nodes" do
    let(:node) { create(:node)}
    subject { described_class.new :node_ids => [node.id]}
    specify "#event" do
      create(:event)
      create(:event, :node => node)
      subject.events.count.should == 1
    end
  end


  context "has both nodes and groups" do
    let(:node) { create(:node)}
    let(:group) { create(:group)}
    subject { described_class.create :node_ids => [node.id], :group_ids => [group.id]}
    specify "#event" do
      group.nodes << create(:node)
      create(:event)
      create(:event, :node => node)
      create(:event, :node => group.nodes.first)
      subject.events.count.should == 2
    end
  end

end
