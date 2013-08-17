require_relative "resource_api"
module NetAtlas
  class EventAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Event
  end
end
