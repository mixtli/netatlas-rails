class CreateNotificationService < ServiceBase

  def call(contact, event)
    notification = Notification.create!(:contact => contact, :event => event)
    NotificationWorker.perform_async(notification.id)
    notification
  end
end
