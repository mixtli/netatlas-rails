require 'queue_processor'
class Collector < QueueProcessor
  def queue_name 
    "collector_queue"
  end

  private
  def post_result(msg)
    puts "COLLECTOR: #{msg}"
    stream = DataStream.where(:data_source_id => msg['data_source_id'], :poller_id => msg['poller_id']).first
    timestamp = msg['timestamp'] || Time.now
    puts "stream = #{stream.inspect}"
    AddDataService.call(stream.id, timestamp.to_i, msg['value'])
    puts "done adding data"
  rescue => e
    puts e.message
    puts e.stacktrace
    raise e
  end
end
