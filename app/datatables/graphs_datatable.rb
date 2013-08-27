class GraphsDatatable < Datatable
  self.model = Graph
  self.columns = [:title, :created_at]
  self.default_scope =  Graph 
  def row(graph)
    [
      graph.title,
      graph.created_at
    ]
  end
end
