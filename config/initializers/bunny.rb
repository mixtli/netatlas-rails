puts "RUNNING BUNNY INITIALIZER"
::BUNNY = Bunny.new(CONFIG['amqp'].symbolize_keys)
puts "BUNNY = #{::BUNNY.inspect}"
#BUNNY.start
