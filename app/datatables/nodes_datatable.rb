class NodesDatatable < Datatable
  self.model = Node
  self.columns = [:label, :state, :type ]
  self.default_scope = ->{ Node }
  def row(node)
    [
      node.label,
      node.state, 
      node.type
    ]
  end
end
