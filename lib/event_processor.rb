require 'queue_processor'
class EventProcessor < QueueProcessor
  def queue_name
    "event_queue"
  end

  def post_result(msg)
    puts "got msg #{msg}"
    CreateEventService.call(msg)
  end
end

