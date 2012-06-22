class Event < ActiveRecord::Base
  belongs_to :poller
  belongs_to :node
  belongs_to :acknowledged_by
  belongs_to :resolved_by
  attr_accessible :acknowledged_at, :additional, :description, :notes, :repeats, :resolved_at, :severity, :state
end
