class Dependency < ActiveRecord::Base
  belongs_to :node
  belongs_to :dependency, :class_name => 'Node'
  validates :node, :presence => true, :associated => true
  validates :dependency, :presence => true, :associated => true
  # attr_accessible :title, :body
end
