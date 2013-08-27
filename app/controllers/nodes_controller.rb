class NodesController < ResourceController
  filter_resource_access
  respond_to :html, :json, :xml
  self.resource_class = Node
  self.datatable_class = NodesDatatable
  def index
    klass = if params[:type]
              # XXX Security issue.  fixme
              eval params[:type]
            else
              self.resource_class
            end

    @q = klass.search(params[:q])
    per_page = params[:per_page] || 10
    @nodes = @q.result.paginate(:per_page => per_page, :page => params[:page])
    iname = self.resource_class.to_s.downcase.pluralize
    instance_variable_set("@#{iname}", @nodes)
    respond_with(@nodes) do |format|
      format.html
      format.json { render :json => @nodes.to_json}
    end
  end
end
