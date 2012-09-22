class QueueProcessor 
  def initialize(options = {})
    @connection_options = options
  end

  def run
    EM.run do
      AMQP.connect(@connection_options.symbolize_keys) do |connection|
        amq = AMQP::Channel.new(connection)
        amq.queue(queue_name, :durable => true).subscribe do |hdr, msg|
          puts "got message #{msg}"
          begin
            post_result(msg)
          rescue => e
            puts "ERROR processing #{queue_name}: #{e.message}"
          end
        end
      end
    end
  end

  def queue_name
    raise "override queue_name in QueueProcessor subclasses"
  end

  def post_result(msg)
    raise "override post_result in QueueProcessor subclasses"
  end

end