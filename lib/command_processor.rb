require 'queue_processor'
class CommandProcessor < QueueProcessor

  def queue_name
    'command_result'
  end

  private
  def post_result(msg)
    puts "got result #{msg}"
    cmd = Command.find(msg['id'])
    if msg['result'] == true
      puts "success!"
      cmd.succeed!
    else
      puts "failure"
      cmd.failure!
    end
    cmd.update_attribute(:message,  msg['message'])
  end
end

