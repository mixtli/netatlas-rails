class EventMailer < ActionMailer::Base
  default from: "alert@netatlas.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.event_email.subject
  #
  def event_email(email, event)
    @greeting = "Hi"
    @event = event
    mail to: email,
         subject: "#{event.severity} #{event.node.try(:to_s)} #{event.description.try(:slice, 0, 30)}"
  end
end
