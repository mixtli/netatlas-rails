require_relative "resource_api"
module NetAtlas
  class NodeAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::Node
  end
end
