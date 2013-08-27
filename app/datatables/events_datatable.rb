class EventsDatatable < Datatable
  self.model = Event
  self.columns = [:node, :state, :severity, :type, :created_at]
  self.default_scope = Event.joins('LEFT OUTER JOIN nodes on nodes.id = events.node_id')
  self.sort_columns = {:node => 'nodes.label'}
  def row(event)
    [
      event.node ? link_to(event.node.label, event.node) : nil, 
      event.state, 
      event.severity, 
      event.type, 
      event.created_at
    ]
  end
end
