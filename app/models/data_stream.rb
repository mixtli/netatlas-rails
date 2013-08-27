require 'open-uri'
class DataStream < ActiveRecord::Base
  belongs_to :data_source
  belongs_to :poller


  def metric_name
    "metric.#{id}"
  end

  def data(from, to)
    params = {:target => metric_name, :from => from.to_i, :until => to.to_i, :format => :json}
    res = JSON.parse(open(CONFIG[:graphite][:url] + "/render?" + params.to_query).read)
    res.first["datapoints"].map { |a| [a[1], a[0]]}
  end
  
  
end
