require 'spec_helper'
require 'collector'
describe Collector do
  subject { Collector.new(CONFIG[:amqp])}
  let(:data_stream) { create(:data_stream) }

  it "should save a result from queue", :truncate do
    ::BUNNY = stub(:queue => nil, :exchange => stub(:publish => nil))
    collector_thread = Thread.new { subject.run }
    time = Time.now
    @rabbit.queue(subject.queue_name, :durable => true)
    msg = {:data_source_id => data_stream.data_source_id, :poller_id => data_stream.poller_id, :timestamp => time.to_i, :value => 10}
    @rabbit.exchange('').publish(msg.to_json, :key => subject.queue_name)
    sleep 1
    data_point = data_stream.data_points.first
    data_point.value.should eql(10.0)
    data_point.timestamp.to_i.should eql(time.to_i)
    data_point.data_stream_id.should eql(data_stream.id)
  end
  
end
