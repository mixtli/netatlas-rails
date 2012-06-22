class Poller < ActiveRecord::Base
  attr_accessible :hostname, :port, :queue_password, :queue_username, :state
  validates :hostname, :presence => true
  validates :queue_username, :presence => true
  validates :queue_password, :presence => true
  #validates :state, :inclusion => %w(up down unknown)
  has_many :poller_nodes
  has_many :nodes, :through => :poller

  state_machine :state, :initial => :unknown do
    state :up
    state :down
  end

end
