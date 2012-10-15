class DataSourcesController < ResourceController
  self.resource_class = DataSource

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
    @data_source = DataSource.new params[:data_source]
    @data_source.arguments ||= {}
    if params[:data_source][:data_template_id]
      template = DataTemplate.find(params[:data_source][:data_template_id])
  
      @data_source.plugin ||= template.plugin
    end
    @data_source.save!
    respond_with(@data_source)
  end
end
