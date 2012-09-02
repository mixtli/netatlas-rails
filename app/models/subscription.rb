class Subscription < ActiveRecord::Base
  belongs_to :group
  belongs_to :poller
  belongs_to :node
  attr_accessible :severity, :state
end
