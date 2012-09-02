require 'spec_helper'

describe Dependency do
  it "should not allow a dependency to a node that doesn't exist" do
    dep = Dependency.new
    dep.node_id = 1
    dep.dependency_id = 1
    dep.should_not be_valid
  end

end
