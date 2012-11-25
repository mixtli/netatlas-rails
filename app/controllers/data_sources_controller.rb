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
      if template.arguments
        template.arguments.each do |k,v|
          @data_source.arguments[k] ||= v
        end
      end
      @data_source.plugin ||= template.plugin
      @data_source.interval ||= template.interval
      @data_source.warning_threshold ||= template.warning_threshold
      @data_source.critical_threshold ||= template.critical_threshold
      @data_source.operator ||= template.operator
    end
    @data_source.save!
    respond_with(@data_source)
  end
end
