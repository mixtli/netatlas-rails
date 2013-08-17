# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
#use Rack::FiberPool

#NetatlasRails::Application.config.middleware.use ExceptionNotifier,
#  :email_prefix => "[NetAtlas] ",
#  :sender_address => %{"notifier"},
#  :exception_recipients => %w{ronmcclain75@gmail.com}

run NetatlasRails::Application
