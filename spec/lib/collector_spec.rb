require 'spec_helper'
require 'collector'
Thread.abort_on_exception = true
describe Collector do
  subject { Collector.new(CONFIG[:amqp])}
  let(:data_stream) { create(:data_stream, :id => 1) }

  it "should save a result from queue", :truncate do
    ::BUNNY = stub(:queue => nil, :exchange => stub(:publish => nil))
    FileUtils.rm_f(CONFIG[:whisper_dir] + "/testmetric/1.wsp")
    collector_thread = Thread.new { subject.run }
    time = Time.now
    @rabbit.queue(subject.queue_name, :durable => true)
    DataStream.any_instance.stub(:metric_name => "testmetric.1")
    msg = {:data_source_id => data_stream.data_source_id, :poller_id => data_stream.poller_id, :timestamp => time.to_i, :value => 10}
    @rabbit.exchange('').publish(msg.to_json, :key => subject.queue_name)
    sleep 1
    d = GraphiteStorage::Whisper.open(CONFIG[:whisper_dir] + "/testmetric/1.wsp")
    puts d.inspect
    res = d[time, time]
    res.first.should == 10.0
  end
  
end
