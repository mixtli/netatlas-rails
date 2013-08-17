require 'spec_helper'

describe User do
  it "should be admin" do
    user = FactoryGirl.build(:user, admin: true)
    user.admin?.should be_true
  end

end
