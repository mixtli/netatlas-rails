class DataSourcesController < ResourceController
  self.resource_class = DataSource

  def index
    conditions = params.dup
    conditions[:data_streams_poller_id_eq] = conditions[:poller_id] if conditions[:poller_id]
    super(conditions)
  end
end
