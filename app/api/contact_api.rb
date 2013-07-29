require_relative "resource_api"
module NetAtlas
  class ContactAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Contact
  end
end
