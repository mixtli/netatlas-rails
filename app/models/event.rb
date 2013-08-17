class Event < ActiveRecord::Base
  belongs_to :poller
  belongs_to :node
  belongs_to :acknowledged_by, :class_name => 'User'
  belongs_to :resolved_by, :class_name => 'User'
  stampable
  attr_accessible :acknowledged_at, :additional, :description, :notes, :repeats, :resolved_at, :severity, :state, :node, :node_id, :arguments

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

  class << self
    def types
      # This method seems to have issues in development mode.  hard coding for now
      # subclasses.map {|c| c.to_s.split("::")[1].underscore } 
      [:event, :snmp_discover]
    end
    def states
      state_machine.states.map &:name
    end
    def severities
      [:ok, :warning, :critical]
    end

    def factory(t, args = {})
      # TODO whitelist possible classnames
      klass_name = "Event::#{t.to_s.camelize}"
      klass = t ? eval(klass_name) : self
      klass.create(args)
    end
  end

  def filters
    # This logic is the inverse of the logic in EventFilter.events.  Must be changed in both places.
    filter_scope = EventFilter.all
    filter_scope = filter_scope.where("node_ids IS NULL OR ? = ANY (node_ids)", node_id)
    filter_scope = filter_scope.where("severities IS NULL OR ? = ANY (severities)", severity)
    filter_scope = filter_scope.where("states IS NULL or ? = ANY (states)", state)
    if node 
      group_ids = node.groups.map(&:id)
      unless group_ids.empty?
        filter_scope = filter_scope.where("group_ids IS NULL or (ARRAY[?] && group_ids)", group_ids)
      end
    end
    filter_scope = filter_scope.where("types IS NULL or ? = ANY (types)", short_type)
    filter_scope
  end

  def subscriptions
    Subscription.where(:event_filter_id => filters)
  end

  def short_type
    type ? type.split('::')[1].underscore : "event"
  end

  def process!
    # override in subclasses
  end

  def to_s
    "#{severity} #{description.try(:slice, 0,20)}"
  end
end
