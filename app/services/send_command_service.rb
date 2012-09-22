require 'service_base'
class SendCommandService < ServiceBase
  def call(poller_id, cmd, arguments = {})
    command = Command.create(:name => cmd, :arguments => arguments)
    command.poller = Poller.find(poller_id)
    command.save!
    command.send_command!
    command
  end
end