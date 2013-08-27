puts "RUNNING BUNNY INITIALIZER"
BUNNY = Bunny.new(CONFIG['amqp'].symbolize_keys)
BUNNY.start
