require_relative "resource_api"
module NetAtlas
  class ServiceAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Service
  end
end
