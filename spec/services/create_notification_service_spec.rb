require 'spec_helper'
describe CreateNotificationService do
  it "should deliver a notification" do
    contact = create(:email_contact)
    notification = subject.call(contact, create(:event))
    notification.should_not be_new_record
    notification.state.should eql("pending")
    expect {
      NotificationWorker.drain
    }.to change{ ActionMailer::Base.deliveries.size}.by(1)
    notification.reload
    notification.state.should eql("delivered")
  end

end
