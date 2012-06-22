EventMachine.next_tick { AMQP.connect(
    :user => CONFIG[:amqp][:user],
    :pass => CONFIG[:amqp][:pass],
    :host => CONFIG[:amqp][:host],
    :vhost => CONFIG[:amqp][:vhost]
)}
