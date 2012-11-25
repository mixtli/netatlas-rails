class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: true, queue: 'notification'

  def perform(notification_id)
    notification = Notification.find(notification_id)
    notification.contact.send_notification(notification.event)
    puts "delivering"
    notification.deliver!
  end
end
