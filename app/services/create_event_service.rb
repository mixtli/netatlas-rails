class CreateEventService < ServiceBase

  def call(args = {})
    event = Event.create(args) 
    event
  end
end
