if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
source 'https://rubygems.org'
gem 'thin'
gem 'rails', '~> 4.0.0'
gem 'pg', :require => 'pg'
#gem 'postgres_ext'
gem 'devise'
gem 'userstamp', :git => 'git://github.com/evendis/userstamp.git'
gem 'declarative_authorization'
gem 'responders'
gem 'haml-rails'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'
gem 'exception_notification'
gem 'state_machine'
gem 'net-snmp', :github => 'mixtli/net-snmp'
gem 'ransack', github: "ernie/ransack", branch: "rails-4" 
gem 'will_paginate'
gem 'jquery-rails'
gem 'dynamic_form'
gem 'capistrano'
gem 'draper'
gem 'daemons'
gem 'amqp'
gem 'bunny'
gem 'grape'
gem 'rabbit_manager', :git => 'git@github.com:mixtli/rabbit_manager.git'
#gem 'rabbit_manager', :path => '/Users/rmcclain/Projects/rabbit_manager'
gem 'rest-client'
gem 'seed-fu'
gem 'statsd-ruby', :require => 'statsd'
gem 'graphite-api'

gem 'jasmine-rails'
gem 'sidekiq'
gem 'ruby_parser' # needed for declarative_authorization for some reason

gem 'sinatra', :require => false
gem 'slim'
gem 'her', :github => 'remiprev/her'

if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
  gem 'netatlas-poller', :path => "#{ENV['HOME']}/Projects/netatlas-poller"
  gem 'netatlas-client', :path => "#{ENV['HOME']}/Projects/netatlas-client", :require => 'netatlas/client'
else
  gem 'netatlas-poller', :git => 'git@github.com:mixtli/netatlas-poller.git', :branch => :staging
  gem 'netatlas-client', :git => 'git@github.com:mixtli/netatlas-client.git', :branch => :staging
end

gem 'coffee-rails'
gem 'uglifier'
gem 'therubyracer'

gem 'sass-rails'
gem 'graphite_storage', :github => 'mleinart/graphite_storage'

group :test, :development do
  gem 'railroady'
  gem 'bullet'
  gem 'ruby-prof'
  gem 'debugger'
  gem 'simplecov', :require => false
  gem 'therubyracer'
  gem 'rspec-rails'
  gem 'capybara'# , :github => 'jnicklas/capybara'
  #gem 'capybara-webkit' #, :github => 'thoughtbot/capybara-webkit'
  gem 'poltergeist'
  group :darwin do
    gem 'rb-fsevent', :require => false 
  end
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem 'terminal-notifier-guard'
  #gem 'growl'
  gem 'rb-readline', '~> 0.4.2' #, :github => 'luislavena/rb-readline'
  gem 'foreman'
  gem 'factory_girl_rails'
  #gem 'guard-livereload'
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
  #gem 'rails-footnotes'
  #gem 'pry'
  #gem 'pry-remote'
  #gem 'pry-stack_explorer'
  #gem 'pry-debugger'
  #gem 'pry-rails'
  #gem 'pry-doc'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'populator'
  gem 'faker'
  gem 'evented-spec'
  gem 'capistrano'
  gem 'timecop'
  #gem 'evergreen'
end


gem 'coffee-rails'
gem 'jquery-ui-rails'
gem 'uglifier' #, '>= 1.0.3'
gem 'zurb-foundation'

#gem 'jquery-datatables-rails', :github => 'rweng/jquery-datatables-rails'


gem 'protected_attributes'
gem 'rails-observers'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'
