require_relative "resource_api"
module NetAtlas
  class DataSourceAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::DataSource
  end
end
