require "addressable/uri"
class GraphRenderer
  def initialize(graph)
    @graph = graph
  end

  def url
    u = CONFIG[:graphite][:url] + "/render"
    uri = Addressable::URI.new
    params = {:target => []}
    @graph.data_sources.each do |d|
      d.data_streams.each do |ds|
        params[:target] << ds.metric_name
      end
    end
    params[:width] = @graph.width || 700
    params[:height] = @graph.height || 250

    uri.query_values = params
    u + "?" + uri.query
  end

  def to_html(from, to)
    uri = url + "&" + {:from => from.to_i, :until => to.to_i}.to_query
    "<img src=\"#{uri}\">"
  end
end
