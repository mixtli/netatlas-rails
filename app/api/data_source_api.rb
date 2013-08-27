require_relative "resource_api"
module NetAtlas
  class DataSourceAPI < Grape::API
    include NetAtlas::Base
    self.resource_class = ::DataSource

    get do
      conditions = params[:q].dup
      conditions[:data_streams_poller_id_eq] = params[:poller_id] if params[:poller_id]
      limit = params[:limit] || 100
      offset = params[:offset] || 0
      puts "IN DS GET #{conditions.inspect}"
      DataSource.search(conditions).result.limit(limit).offset(offset)
    end
  end
end
