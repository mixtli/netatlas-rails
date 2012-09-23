require 'spec_helper'
require 'event_processor'
describe EventProcessor do
  subject { described_class.new(CONFIG['amqp'].symbolize_keys)}
  let(:node) { create(:node) }

  it "should save a result from queue", :truncate do
    Thread.abort_on_exception = true
    collector_thread = Thread.new { subject.run }
    time = Time.now
    event = {:node_id => node.id }
    @rabbit.queue(subject.queue_name, :durable => true)
    @rabbit.exchange('').publish(event.to_json, :key => subject.queue_name)
    sleep 3
    collector_thread.kill
    Event.first.node_id.should eql(node.id)
  end 
end
