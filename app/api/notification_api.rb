require_relative "resource_api"
module NetAtlas
  class NotificationAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Notification
  end
end
