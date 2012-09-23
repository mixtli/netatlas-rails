require 'spec_helper'
require 'command_processor'

describe CommandProcessor do
  let(:poller) { create(:poller)}
  let(:command) { create(:command, :state => :queued) }
  subject { described_class.new(CONFIG['amqp'].symbolize_keys)}

  it "should process a result", :truncate do
    processor_thread = Thread.new { subject.run }
    @rabbit.queue(subject.queue_name, :durable => true)
    @rabbit.exchange('').publish({'id' => command.id, 'result' => true}.to_json, :key => subject.queue_name)
    sleep 2
    processor_thread.kill
    command.reload
    command.state.should eql('success')
  end
end