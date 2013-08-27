class Interface < Node
  self.table_name = 'interfaces'
  self.sequence_name = 'nodes_id_seq'
  attr_accessible :hostname, :ip_address 
  validates :ip_address, :presence => true
  before_create {|d| d.label = d.ip_address.to_s unless d.label }
  after_save :notify_pollers


  def to_s; label;  end

  def dependencies
    super + [device]
  end

  def as_json(options = {}) 
    result = super(options)
    result['interface']['ip_address'] = ip_address.to_s
    result
  end
end
