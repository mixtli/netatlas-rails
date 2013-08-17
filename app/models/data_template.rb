class DataTemplate < ActiveRecord::Base
  belongs_to :plugin
  attr_accessible :arguments, :critical_threshold, :description, :interval, :name, :operator, :warning_threshold
  before_create :set_defaults
  serialize :arguments
  def to_s; name; end

  def set_defaults
    self.arguments ||= {}
  end

end
