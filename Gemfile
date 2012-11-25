source 'https://rubygems.org'
gem 'thin'
gem 'rails', '3.2.5'
gem 'backbone-on-rails'
gem 'pg', :require => 'pg'
gem 'postgres_ext'
gem 'devise'
gem 'userstamp', :git => 'git://github.com/evendis/userstamp.git'
gem 'declarative_authorization'
gem 'responders'
gem 'haml-rails'
gem 'simple_form'
gem 'exception_notification'
gem 'state_machine'
gem 'ransack'
gem 'will_paginate'
gem 'jquery-rails'
gem 'dynamic_form'
gem 'capistrano'
gem 'draper'
gem 'daemons'
gem 'amqp'
gem 'bunny'
gem 'rabbit_manager', :git => 'git@github.com:mixtli/rabbit_manager.git'
#gem 'rabbit_manager', :path => '/Users/rmcclain/Projects/rabbit_manager'
gem 'rest-client'
gem 'seed-fu'
gem 'activerecord-postgres-hstore', git: 'git://github.com/softa/activerecord-postgres-hstore.git'

gem 'jasmine-rails'
gem 'sidekiq'
gem 'ruby_parser' # needed for declarative_authorization for some reason

gem 'sinatra', :require => false
gem 'slim'
gem 'strong_parameters'

#if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
  gem 'netatlas-poller', :path => "#{ENV['HOME']}/Projects/netatlas-poller"
#else
#  gem 'netatlas-poller', :git => 'git@github.com:mixtli/netatlas-poller.git'
#end
#if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
  gem 'netatlas-client', :path => "#{ENV['HOME']}/Projects/netatlas-client", :require => 'netatlas/client'
#else
#  gem 'netatlas-client', :git => 'git@github.com:mixtli/netatlas-client.git'
#end
 
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'therubyracer'
end


group :test, :development do
  gem 'railroady'
  gem 'bullet'
  gem 'ruby-prof'
  gem 'debugger'
  gem 'simplecov', :require => false
  gem 'therubyracer'
  gem 'rspec-rails'
  gem 'capybara'# , :github => 'jnicklas/capybara'
  gem 'capybara-webkit' #, :github => 'thoughtbot/capybara-webkit'
  group :darwin do
    gem 'rb-fsevent', :require => false 
  end
  gem 'spork-rails'
  gem 'terminal-notifier-guard'
  #gem 'growl'
  gem 'rb-readline' #, :github => 'luislavena/rb-readline'
  gem 'foreman'
  gem 'factory_girl_rails'
  gem 'guard-livereload'
  gem 'guard-ctags-bundler'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-rails-assets'
  gem 'guard-jasmine-headless-webkit'
  gem 'guard-bundler'
  gem 'guard-coffeescript'
  gem 'guard-migrate'
  gem 'guard-process'
  gem 'guard-sidekiq'
  gem 'rails-footnotes'
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'populator'
  gem 'faker'
  gem 'evented-spec'
  gem 'capistrano'
  gem 'timecop'
  #gem 'evergreen'
end


group :assets do
  gem 'coffee-rails'
  gem 'jquery-ui-rails'
  #gem 'twitter-bootstrap-rails'
  gem 'bootstrap-sass'
  gem 'sass-rails'
  gem 'compass-rails'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platform => :ruby
  gem 'uglifier' #, '>= 1.0.3'
  gem 'jquery-datatables-rails', :github => 'rweng/jquery-datatables-rails'
end


