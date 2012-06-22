class PollerNode < ActiveRecord::Base
  belongs_to :poller
  belongs_to :node
  validates :poller, :presence => true
  validates :node, :presence => true
end
