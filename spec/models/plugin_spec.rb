require 'spec_helper'

describe Plugin do

  it "should require a name" do
    plugin = Plugin.new(:class_name => 'Foo')
    plugin.should_not be_valid
  end
  it "should create a plugin" do
    plugin = Plugin.new(:name => "A plugin", :class_name => "MyPlugin")
    plugin.should be_valid
  end
end
