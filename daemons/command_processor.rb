require ENV["RAILS_ENV_PATH"]
require "command_processor"

processor = CommandProcessor.new(CONFIG[:amqp])
processor.run

