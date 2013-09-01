class GraphTemplatesDatatable < Datatable
  self.model = GraphTemplate
  self.columns = [:title, :created_at]
  self.default_scope =  -> {GraphTemplate }
  def row(graph)
    [
      graph.title,
      graph.created_at
    ]
  end
end
