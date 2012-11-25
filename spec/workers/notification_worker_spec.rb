require 'spec_helper'

describe NotificationWorker do

  before do
    described_class.jobs.clear
  end

  it "should add job to queue" do
    expect {
      described_class.perform_async(build(:notification).id)
    }.to change { described_class.jobs.size}.by(1)
  end

  it "should deliver a notification" do
    described_class.perform_async(create(:notification, :contact => create(:email_contact)))
    expect {
      described_class.drain
    }.to change { ActionMailer::Base.deliveries.size}.by(1)
  end
end
