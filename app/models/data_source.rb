class DataSource < ActiveRecord::Base
  belongs_to :node
  belongs_to :plugin
  belongs_to :data_template
  attr_accessible :arguments, :critical_threshold, :description, :interval, :last_polled_at, :operator, :state, :varbinds, :warning_threshold, :node_id, :data_template_id, :poller_ids, :plugin_id
  has_many :data_streams, :dependent => :destroy
  has_many :pollers, :through => :data_streams
  serialize :arguments
  validates :node, :associated => true, :presence => true
  validates :plugin, :associated => true
  validates :plugin_id, :presence => true

  after_create :queue_data_source
  after_destroy :remove_data_source

  def queue_data_source
    pollers.each do |p|
      SendCommandService.call(p.id, :add_data_source, :data_source => self.attributes)
    end
  end

  def remove_data_source
    pollers.each do |p|
      SendCommandService.call(p.id)
    end
  end

  def ip_address
    node.get_ip_address
  end

  def as_json(options)
    ds = super
    ds[:plugin_name] = plugin.name
    ds[:ip_address] = ip_address.to_s
    ds
  end
end
