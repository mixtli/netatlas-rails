# Add a data point
class AddDataService < ServiceBase

  def call(stream_id, timestamp, value)
    puts "in call"
    stream = DataStream.find(stream_id)
    add_metric(stream, value, Time.at(timestamp))
    puts "done call"
  end

  def add_metric(ds, value, time = nil)
    time ||= Time.now
    begin
       self.class.graphite.metrics({ds.metric_name => value}, time)
    rescue => e
      puts e.inspect
      raise e
    end
  end

  def self.graphite
    graphite_endpoint = "#{CONFIG[:graphite]['hostname']}:#{CONFIG[:graphite]['port']}"
    @graphite ||= GraphiteAPI.new(graphite: graphite_endpoint)
  end
end
