require 'userstamp'
ActiveRecord::Base.include_root_in_json = true
Dir["#{Rails.root}/app/api/**"].each {|f| require "#{f}" }

class NetAtlasAPI < Grape::API
  logger Rails.logger
  rescue_from :all do |e|
    Rails.logger.info e.message
    Rails.logger.info e.backtrace.join("\n")
    rack_response({:error => e.message + e.backtrace.join("n")})
  end
  helpers do
    def logger
      Rails.logger
    end
  end
  mount NetAtlas::DeviceAPI => '/devices'
  mount NetAtlas::ServiceAPI => '/services'
  mount NetAtlas::DataSourceAPI => '/data_sources'
  mount NetAtlas::InterfaceAPI => '/interfaces'
  mount NetAtlas::ContactAPI => '/contacts'
  mount NetAtlas::EventAPI => '/events'
  mount NetAtlas::EventFilterAPI => '/event_fitlers'
  mount NetAtlas::NotificationAPI => '/notifications'
  mount NetAtlas::PollerAPI => '/pollers'
  mount NetAtlas::NodeAPI => '/nodes'
end

