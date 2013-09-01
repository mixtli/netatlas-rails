class OutagesDatatable < Datatable
  self.model = Outage
  self.columns = [:node, :start_time, :end_time]
  self.default_scope = -> { Outage.includes(:node) }
  self.sort_columns = {:node => 'nodes.label'}
  def row(outage)
    [
      outage.node.label,
      outage.start_time, 
      outage.end_time 
    ]
  end
end
