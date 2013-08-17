require 'spec_helper'
describe SendCommandService do
  include EventedSpec::AMQPSpec
  let(:poller) { create(:poller)}
  #default_options CONFIG['amqp'].symbolize_keys
  default_timeout 4
  amqp_before do
    connection = AMQP.connect(CONFIG[:amqp].symbolize_keys)
    @channel = AMQP::Channel.new(connection)
  end

  it "should send a command to queue" do
    amqp do
      command = described_class.call(poller.id, :scan)
      command.poller_id.should eql(poller.id)
      command.name.should eql(:scan)
      queue = @channel.queue("command_#{command.poller_id}", :durable => true)
      queue.subscribe do |hdr, msg|
        msg = JSON.parse(msg)['command']
        msg['id'].should eql(command.id)
        msg['name'].should eql('scan')
        msg['arguments'].should eql({})
        done { queue.unsubscribe; queue.delete }
      end
    end
  end
  
end
