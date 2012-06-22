class Command < ActiveRecord::Base
  belongs_to :poller
  validates :poller, :presence => true, :associated => true
  validates :name, :presence => true
  attr_accessible :arguments, :message
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
    AMQP::Channel.new do |channel|
      msg = self.to_json(:only => [:name, :id, :arguments])
      channel.direct("").publish msg , :routing_key => "command_#{poller.id}"
    end
  end
end
