class DataTemplate < ActiveRecord::Base
  belongs_to :plugin
  attr_accessible :arguments, :critical_threshold, :description, :interval, :name, :operator, :warning_threshold
end
