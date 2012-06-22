class CommandProcessor

  def run
    AMQP.run do
      amq = AMQP::Channel.new
      amq.queue('command').subscribe do |hdr, msg|
        post_result(msg)
      end
    end
  end

  private
  def post_result(msg)
    cmd = Command.find(msg['id'])
    if msg['result'] == true
      cmd.succeed!
    else
      cmd.failure!
    end
    cmd.update_attribute(:message,  msg['message'])
  end
end

