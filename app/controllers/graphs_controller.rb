class GraphsController < ResourceController
  self.resource_class = Graph
  self.datatable_class = GraphsDatatable
  respond_to :html, :json

  def data
    start_time = params[:start] || Time.now.to_i
    end_time = params[:end] || (Time.now - 1.day).to_i
    @graph = Graph.find(params[:id])
    d = {}
    @graph.data_sources.each do |ds|
      d[ds.id] = {}
      ds.data_streams.each do |s|
        d[ds.id][s.id] = s.data(start_time, end_time).select {|s| s[1] }
      end
    end
    render :json => d
  end
end
