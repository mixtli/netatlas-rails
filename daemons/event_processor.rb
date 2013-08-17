require ENV["RAILS_ENV_PATH"]
require "event_processor"

processor = EventProcessor.new
processor.run

