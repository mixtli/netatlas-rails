class Interface < Node
  self.table_name = 'interfaces'
  self.sequence_name = 'nodes_id_seq'
  attr_accessible :hostname, :ip_address 
  #validates :ip_address, :presence => true
  before_create {|d| d.label = d.ip_address.to_s unless d.label }

end
