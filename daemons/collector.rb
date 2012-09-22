require ENV["RAILS_ENV_PATH"]
require "collector"

collector = Collector.new(CONFIG[:amqp])
collector.run

