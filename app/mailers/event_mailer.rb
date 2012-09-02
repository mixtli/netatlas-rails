class EventMailer < ActionMailer::Base
  default from: "alert@netatlas.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.new_event.subject
  #
  def new_event(user,event)
    @greeting = "Hi"
    @event = event

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.resolved_event.subject
  #
  def resolved_event(user,event)
    @greeting = "Hi"
    @event = event

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event.acknowledged_event.subject
  #
  def acknowledged_event(user,event)
    @greeting = "Hi"
    @event = event
    mail to: user.email
  end
end
