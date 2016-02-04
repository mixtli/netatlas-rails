class Graph < ActiveRecord::Base
  belongs_to :graph_template
  has_many :items, :class_name => 'GraphItem'
  has_many :data_sources, :through => :items
  attr_accessible :title, :options
end
