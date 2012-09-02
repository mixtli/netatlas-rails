require "spec_helper"

describe Event do
  let(:user) { create(:user)}
  let(:event) { create(:event)}
  describe "new_event" do
    let(:mail) { EventMailer.new_event(user, event) }

    it "renders the headers" do
      mail.subject.should eq("New event")
      mail.to.should eq([user.email])
      mail.from.should eq(["alert@netatlas.com"])
    end

    it "renders the body" do
      puts mail.body.inspect
      mail.body.encoded.should match(/new/i)
    end
  end

  describe "resolved_event" do
    let(:mail) { EventMailer.resolved_event(user, event) }

    it "renders the headers" do
      mail.subject.should eq("Resolved event")
      mail.to.should eq([user.email])
      mail.from.should eq(["alert@netatlas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(/resolved/i)
    end
  end

  describe "acknowledged_event" do
    let(:mail) { EventMailer.acknowledged_event(user, event) }

    it "renders the headers" do
      mail.subject.should eq("Acknowledged event")
      mail.to.should eq([user.email])
      mail.from.should eq(["alert@netatlas.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(/acknowledged/i)
    end
  end

end
