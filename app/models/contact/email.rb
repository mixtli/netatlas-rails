class Contact::Email < Contact
  def send_notification(event)
    EventMailer.event_email(self.email, event).deliver
  end
  def to_s
    email
  end
end
