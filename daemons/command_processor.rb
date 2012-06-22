require ENV["RAILS_ENV_PATH"]
require "command_processor"

processor = CommandProcessor.new
processor.run

