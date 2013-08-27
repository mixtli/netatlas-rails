class DataTemplatesDatatable < Datatable
  self.model = DataTemplate
  self.columns = [:name, :plugin]
  self.default_scope = DataTemplate
  def row(dt)
    [link_to(dt, dt), dt.plugin.name]
  end
end
