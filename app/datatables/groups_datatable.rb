class GroupsDatatable < Datatable
  self.model = Group
  self.columns = [:name, :created_at]
  self.default_scope = ->{ Group }
  def row(group)
    [
      group.name,
      group.created_at
    ]
  end
end
