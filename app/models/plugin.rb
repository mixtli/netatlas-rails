require 'netatlas'
class Plugin < ActiveRecord::Base
  attr_accessible :class_name, :name
  validates :name, :presence => true
  validates :class_name, :presence => true

  def to_s; name; end

  def instance
    eval "NetAtlas::Plugin::#{class_name}.new"
  end

  def argument_list
    instance.class.argument_types
  end
end
