require 'securerandom'
class Poller < ActiveRecord::Base
  attr_accessible :hostname, :port, :queue_password, :queue_username, :state
  validates :hostname, :presence => true
  #validates :queue_username, :presence => true
  #validates :queue_password, :presence => true
  #validates :state, :inclusion => %w(up down unknown)
  has_many :poller_nodes
  has_many :nodes, :through => :poller
  has_many :data_streams
  has_many :data_sources, :through => :data_streams
  belongs_to :creator, :class_name => 'User'
  before_create :generate_credentials

  state_machine :state, :initial => :unknown do
    state :up
    state :down
  end

  def generate_credentials
    self.queue_username ||=  creator.email
    self.queue_password ||=  SecureRandom.hex(16)
  end

  def to_s
    hostname
  end

end
