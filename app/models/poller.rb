class Poller < ActiveRecord::Base
  attr_accessible :hostname, :port, :queue_password, :queue_username, :state
  validate :hostname, :required => true
  validate :queue_username, :required => true
  validate :queue_password, :required => true
end
