class DataSourcesDatatable < Datatable
  self.model = DataSource
  self.columns = [:id, :node, :plugin]
  self.default_scope = -> {DataSource }
  self.sort_columns = {:node => 'nodes.label'}
  def row(dt)
    [link_to(dt.id, dt), link_to(dt.node.label, dt.node), dt.plugin.name]
  end
end
