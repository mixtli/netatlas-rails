require 'queue_processor'
class Collector < QueueProcessor
  def queue_name 
    "collector_queue"
  end

  private
  def post_result(msg)
    Rails.logger.debug "COLLECTOR: #{msg}"
    stream = DataStream.where(:data_source_id => msg['data_source_id'], :poller_id => msg['poller_id']).first
    timestamp = msg['timestamp'] || Time.now
    puts "stream = #{stream.inspect}"
    AddDataService.call(stream.id, timestamp.to_i, msg['value'])
  end
end
