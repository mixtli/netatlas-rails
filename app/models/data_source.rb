class DataSource < ActiveRecord::Base
  belongs_to :node
  belongs_to :plugin
  belongs_to :data_template
  attr_accessible :arguments, :critical_threshold, :description, :interval, :last_polled_at, :operator, :state, :varbinds, :warning_threshold
  has_many :data_streams
  has_many :pollers, :through => :data_streams
  validates :node, :associated => true, :presence => true
  validates :plugin, :associated => true, :presence => true
end
