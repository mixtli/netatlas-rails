require "spec_helper"

describe Event do
  let(:user) { create(:user)}
  let(:event) { create(:event, :severity => :critical)}
  describe "event_email" do
    let(:mail) { EventMailer.event_email(user, event) }

    it "renders the headers" do
      mail.subject.should match(/#{event.severity.to_s}/)
      mail.to.should eq([user.email])
      mail.from.should eq(["alert@netatlas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(/critical/i)
    end
  end

end
