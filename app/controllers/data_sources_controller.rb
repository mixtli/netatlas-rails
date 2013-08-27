class DataSourcesController < ResourceController
  self.resource_class = DataSource
  self.datatable_class = DataSourcesDatatable

  def index
    conditions = params.dup
    conditions[:data_streams_poller_id_eq] = conditions[:poller_id] if conditions[:poller_id]
    super(conditions)
  end
  def new
    @data_source = DataSource.new
    @data_source.node_id = params[:node_id] if params[:node_id]
    respond_with(@data_source)
  end

  def create
    logger.debug params.inspect
    @data_source = DataSource.new params[:data_source]
    @data_source.arguments ||= {}
    if @data_source.valid?
      @data_source.save!
    else
      #raise "invalid data source #{@data_source.errors}"
    end
    respond_with(@data_source)
  end
end
