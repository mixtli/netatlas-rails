class Event < ActiveRecord::Base
  belongs_to :poller
  belongs_to :node
  belongs_to :acknowledged_by, :class_name => 'User'
  belongs_to :resolved_by, :class_name => 'User'
  stampable
  attr_accessible :acknowledged_at, :additional, :description, :notes, :repeats, :resolved_at, :severity, :state, :node, :node_id

  state_machine :state, :initial => :open do
    state :acknowledged
    state :resolved

    event :acknowledge do
      transition any => :acknowledged
    end
    event :resolve do
      transition any => :resolved
    end

    
    before_transition :on => :acknowledge do |e, t|
      #puts "in here.  current_user = #{Authorization.current_user.inspect}"
      e.acknowledged_at = Time.now
      e.acknowledged_by = Authorization.current_user
    end

    before_transition :on => :resolve do |e, t|
      e.resolved_at = Time.now
      e.resolved_by = Authorization.current_user
    end
  end
end
