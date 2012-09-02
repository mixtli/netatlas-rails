class EventService
  def self.call(args)
    self.class.new.call(args = {})
  end

  def call(args = {})
    event = Event.create(args) 
    
    event
  end
end