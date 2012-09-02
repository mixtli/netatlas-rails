describe Event do
  before do
    @current_user = create(:user)
    User.stamper = @current_user
    Authorization.stub(:current_user) { @current_user }
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
end