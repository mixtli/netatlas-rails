require 'spec_helper'

describe Contact do
  context "#send_notification" do
    it "should raise an error" do
      lambda {
        subject.send_notification(build(:event))
      }.should raise_error(RuntimeError)
    end
  end
end
