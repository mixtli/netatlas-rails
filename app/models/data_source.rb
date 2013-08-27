class DataSource < ActiveRecord::Base
  belongs_to :node
  belongs_to :plugin
  belongs_to :data_template
  attr_accessible :arguments, :critical_threshold, :description, :interval, :last_polled_at, :operator, :state, :varbinds, :warning_threshold, :node_id, :data_template_id, :poller_ids, :plugin_id
  has_many :data_streams, :dependent => :destroy
  has_many :pollers, :through => :data_streams
  # are the graph associations really necessary?
  #has_many :graph_sources
  #has_many :graphs, :through => :graph_sources
  validates :node, :presence => true
  validates :plugin, :associated => true
  validates :plugin_id, :presence => true

  after_save :queue_data_source
  after_destroy :remove_data_source

  def queue_data_source
    logger.info "queue_data_source"
    pollers.each do |p|
      SendCommandService.call(p.id, :add_data_source, self.as_json)
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

  def as_json(options = {})
    ds = super(options.merge(:include => :node))
    ds['data_source']['plugin_name'] = plugin.name
    ds['data_source']['ip_address'] = ip_address.to_s
    ds
  end
  def to_s
    "#{node.label}:#{plugin.name}:#{id}" 
  end
end
