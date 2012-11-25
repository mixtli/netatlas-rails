describe CreateEventService do
  it "should create an event" do
    event = subject.call
    event.should_not be_new_record
    event.state.should eql("open")
  end

  it "should send email to a subscribed user" do
    node = create(:node)
    user = create(:user)
    event_filter = EventFilter.create(:node_ids => [node.id])
    subscription = create(:subscription, :event_filter => event_filter, :user => user)
    NotificationWorker.should_receive(:perform_async)
    event = subject.call(:node => node)
  end

  it "should create an discovery event" do
    node_hash = {
      :type => :device,
      :hostname => 'foo.lvh.me',
      :ip_address => '127.0.0.1',
      :os => 'Mountain Lion',
      :os_version => "10.7",
      :snmp_version => '2c'
    }
    event = subject.call(:type => 'discovery', :arguments => node_hash)
    event.should be_kind_of(Event::Discovery)
    event.should_not be_new_record
    event.node.should_not be_new_record
    event.node.snmp_version.should eql('2c')
    event.node_id.should_not be_nil
    event.should_not be_changed
  end

end
