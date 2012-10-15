require 'spec_helper'

describe Plugin do
  subject { build(:plugin, :class_name => 'HTTP') }

  it "should require a name" do
    plugin = Plugin.new(:class_name => 'Foo')
    plugin.should_not be_valid
  end
  it "should create a plugin" do
    plugin = Plugin.new(:name => "A plugin", :class_name => "MyPlugin")
    plugin.should be_valid
  end
  it "should get associated plugin", :focus  do
    subject.argument_list.should be_kind_of(Hash)
    subject.argument_list[:warning_threshold].should be_kind_of(Hash)
  end
end
