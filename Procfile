#rails:  rails server
#test_server: rails server -e test -p 3001
#eventd: script/daemon run event_processor.rb

#guard:  guard
sidekiq: sidekiq
command_processor: script/daemon run command_processor.rb
event_processor: script/daemon run event_processor.rb
collector: script/daemon run collector.rb
statsd: node /opt/statsd/stats.js /opt/statsd/config.js
carbon-cache: /opt/graphite/bin/carbon-cache.py start

