require_relative "resource_api"
module NetAtlas
  class InterfaceAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Interface
  end
end
