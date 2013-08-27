class Service < Node
  attr_accessible :service_type_id, :port, :device_id
  self.table_name = 'services'
  self.sequence_name = 'nodes_id_seq'
  scope :term_search, ->(term) { where("label like ?", "%#{term}%")}
  belongs_to :service_type

  def to_s; label; end
end
