require 'spec_helper'

describe User do
  it "should be admin" do
    user = build(:user, admin: true)
    user.admin?.should be_true
  end
  it "should create a contact" do
    user = create(:user, :email => 'foo@bar.com')
    user.contacts.first.class.should == Contact::Email
    user.contacts.first.email.should == 'foo@bar.com'
  end
end
