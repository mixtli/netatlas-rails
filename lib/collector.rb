require 'queue_processor'
class Collector < QueueProcessor
  def queue_name 
    "collector_queue"
  end

  private
  def post_result(msg)
    stream_id, timestamp, value = msg.split(',')
    AddDataService.call(stream_id, timestamp.to_i, value)
  end
end