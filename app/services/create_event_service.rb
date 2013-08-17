require_relative "service_base"
class CreateEventService < ServiceBase

  def call(args = {})
    type = args.delete(:type)
    event = Event.factory(type, args) 
    event.process!
    send_notifications(event)
    event
  end

  private
  def send_notifications(event)
    event.subscriptions.each do |subscription|
      subscription.user.contacts.each do |contact|
        CreateNotificationService.call(contact, event)
      end
    end
  end
end
