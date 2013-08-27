class Graph < ActiveRecord::Base
  has_many :items, :class_name => 'GraphItem'
  has_many :data_sources, :through => :items
  attr_accessible :title, :options
end
