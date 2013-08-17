class Plugin < ActiveRecord::Base
  attr_accessible :class_name, :name
  validates :name, :presence => true
  validates :class_name, :presence => true
end
