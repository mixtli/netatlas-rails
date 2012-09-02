describe EventService do
  it "should create an event" do
    event = subject.call
    event.should_not be_new_record
    event.state.should eql("open")
  end

  it "should send email to a subscribed user" do
    node = create(:node)
    user = create(:user)
    subscription = create(:subscription, :node => node, :user => user)
    event = subject.call(:node => node)
  end

end