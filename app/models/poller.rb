class Poller < ActiveRecord::Base
  attr_accessible :hostname, :port, :queue_password, :queue_username, :state
  validates :hostname, :presence => true
  validates :queue_username, :presence => true
  validates :queue_password, :presence => true
  validates :state, :inclusion => %w(up down unknown)
end
