class EventProcessor

  def run
    AMQP.run do
      amq = AMQP::Channel.new
      amq.queue('event').subscribe do |hdr, msg|
        post_result(msg)
      end
    end
  end

  private
  def post_result(msg)
    Event.create(msg)
  end
end

