require_relative "resource_api"
module NetAtlas
  class PollerAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Poller
  end
end
