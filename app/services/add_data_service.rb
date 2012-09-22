# Add a data point
class AddDataService < ServiceBase

  def call(stream_id, timestamp, value)
    DataPoint.create!(:data_stream_id => stream_id, :timestamp => Time.at(timestamp), :value => value)
  end
end