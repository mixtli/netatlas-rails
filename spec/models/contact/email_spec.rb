require 'spec_helper'

describe Contact::Email do
  subject { create(:email_contact) }

  it "should send an email notification" do
    event = create(:event)
    ->() {
      subject.send_notification(event)
    }.should change {ActionMailer::Base.deliveries.size}.by(1)
  end
end
