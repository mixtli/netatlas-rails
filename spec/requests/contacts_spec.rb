require 'spec_helper'

describe "Contacts List" do
  let(:user) { FactoryGirl.create(:user) }

  it "should redirect to login if not logged in" do
    visit contacts_path
    page.should have_selector("#user_password")
  end

  describe "navigate to contacts page as a user"  do
    before(:each) do
      login_as(user)
      1.upto(25) do |n|
        create(:email_contact, :email => 'abc@foo.com')
      end
      visit contacts_path 
    end

    it "should get contact listing" do
      page.body.scan("abc@foo.com").size.should == 9
    end

    it "should go to edit view when edit clicked" do 
      click_link 'Edit'
      page.should have_content("Editing Contact")
      page.should have_content(user.contacts.first.email)
    end
  end
end
