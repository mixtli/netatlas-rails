require_relative "resource_api"
module NetAtlas
  class DeviceAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Device
  end
end
