NetatlasRails::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  config.eager_load = false

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Expands the lines which load the assets
  config.assets.debug = true


  ###  CUSTOM CONFIG BELOW ###

  config.action_mailer.default_url_options = { :host => 'lvh.me:3000' }
  config.sass.style = :nested

  #config.threadsage!

  #config.ember.variant = :development 

end
  silence_warnings do
    begin
      require 'pry'
      IRB = Pry
    rescue LoadError => e
      puts "Pry not installed"
      puts e.inspect
    end
  end

