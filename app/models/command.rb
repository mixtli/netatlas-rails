class Command < ActiveRecord::Base
  belongs_to :poller
  validates :poller, :presence => true, :associated => true
  validates :name, :presence => true
  attr_accessible :arguments, :message, :name
  state_machine :state, :initial => :pending do
    before_transition any => :queued, :do => :queue_command 
    state :success
    state :failure

    event :succeed do
      transition :queued => :success
    end

    event :failure do
      transition any => :failure
    end

    event :send_command do
      transition :pending => :queued
    end
  end

  #private
  def queue_command 
    msg = self.to_json(:only => [:name, :id, :arguments])
    # conn = AMQP.connect(CONFIG[:amqp].symbolize_keys)
    # AMQP::Channel.new(conn) do |channel|
    #   queue = channel.queue("command_#{poller.id}", :durable => true)
    #   channel.direct("").publish msg , :routing_key => "command_#{poller.id}"
    # end
    #puts CONFIG[:amqp].symbolize_keys
    #bunny = Bunny.new(CONFIG[:amqp].symbolize_keys) #.merge({:logging => true}))
    #bunny.start
    BUNNY.queue('command_' + poller.id.to_s, :durable => true)
    BUNNY.exchange('').publish(msg, :key => "command_#{poller.id}")
  end
end
