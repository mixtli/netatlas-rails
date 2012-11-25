class QueueProcessor 
  def initialize(options = {})
    @connection_options = options.symbolize_keys
    @logger = options[:logger] || Rails.logger
  end

  def run
    EM.run do
      @logger.debug "#{queue_name} Listener started"
      @logger.debug(@connection_options)
      AMQP.connect(@connection_options.symbolize_keys) do |connection|
        amq = AMQP::Channel.new(connection)
        amq.queue(queue_name, :durable => true).subscribe do |hdr, msg|
          msg = JSON.parse(msg)
          @logger.debug "#{queue_name} RECEIVED: #{msg.inspect}"
          begin
            post_result(msg)
          rescue => e
            @logger.error "ERROR processing #{queue_name}: #{msg.inspect} #{e.message}"
            @logger.error e.backtrace
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
