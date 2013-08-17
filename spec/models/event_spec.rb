describe Event do
  before do
    @current_user = create(:user)
    User.stamper = @current_user
    Authorization.stub(:current_user) { @current_user }
  end

  context "#factory" do
    it "should generate an snmp_discovery event" do
      event = described_class.factory(:discovery, :node => build(:node))
      event.class.should == Event::Discovery
      event.should_not be_new_record
    end
  end

  it "should set created_at & created_by" do
    subject.save
    subject.created_at.should be_kind_of(Time)
    subject.creator.should eq(@current_user)
  end 

  it "should initially be open" do
    subject.state.should eql("open") 
  end

  it "should resolve an issue" do
    Timecop.freeze(Time.now + 1.minute)
    subject.resolve!
    subject.resolved_at.should eq(Time.zone.now)
    subject.resolved_by.should == Authorization.current_user
    subject.state.should eq("resolved")
  end

  it "should set acknowledged_at timestamp" do
    Timecop.freeze(Time.now + 1.minute)
    subject.acknowledge!
    subject.acknowledged_at.should eq(Time.zone.now)
  end
  context "subscriptions" do
    it "should find matching subscriptions" do
      node = create(:node)
      filter = EventFilter.create :node_ids => [node.id]
      event = create(:event, :node => node)
      user = create(:user)
      subcription = create(:subscription, :event_filter => filter, :user => user)

      event.subscriptions.size.should == 1
      
    end
  end

  context "filters" do
    it "should find matching filters based on node" do
      node = create(:node)
      EventFilter.create :node_ids => [node.id] # matches the node
      EventFilter.create  # matches a null node
      3.times { EventFilter.create :node_ids => [create(:node).id] } # should not match these
      event = create(:event, :node => node)
      event.filters.size.should == 2
    end

    it "should find matching filters when node is not set" do
      EventFilter.create!  # matches a null node
      3.times { EventFilter.create! :node_ids => [create(:node).id] } # should not match these
      event = create(:event, :node => nil)
      event.filters.size.should == 1
    end

    it "should find matching filters when state is set" do
      EventFilter.create! :severities => ['warning', 'critical']
      EventFilter.create!
      EventFilter.create! :severities => ['ok']
      event = create(:event, :severity => 'critical')
      event.filters.size.should == 2
    end

    it "should find matching filters for types" do
      EventFilter.create!  
      EventFilter.create!(:types => ["discovery"])
      EventFilter.create!(:types => ['foo', 'bar'])
      event = create(:event, :type => 'Event::Discovery')
      event.filters.count.should == 2
    end

    it "should find filters matching groups" do
      group = create(:group)
      group2 = create(:group)
      node = create(:node)
      node.groups << group
      node.groups << create(:group)
      EventFilter.create! :group_ids => [group.id] # should include matching group
      EventFilter.create! # should include null group
      EventFilter.create! :group_ids => [group2.id] # should not include non matching group
      event = create(:event, :node => node) 
      event.filters.size.should == 2
    end
  end
end
