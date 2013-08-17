require 'spec_helper'

describe Contact::Postback do
  subject { create(:postback_contact, :url => 'http://fsagsa.me/foobar') }

  it "should send a postback notification" do
    event = create(:event)
    subject.send(:connection).should_receive(:post).and_return(stub(:status => 200))
    subject.send_notification(event).should be_true
  end

  it "should raise an error on non 200" do
    event = create(:event)
    expect {
      subject.send_notification(event)
    }.to raise_error
  end
end
