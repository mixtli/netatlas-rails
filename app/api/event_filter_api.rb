require_relative "resource_api"
module NetAtlas
  class EventFilterAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::EventFilter
  end
end
