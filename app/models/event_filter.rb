class EventFilter < ActiveRecord::Base
  attr_accessible :group_ids, :node_ids, :severities, :states, :types
  has_many :subscriptions

  def events
    # This logic is the inverse of Event.filters and should be updated in both places
    event_scope = Event.all
    node_list = []
    if node_ids
      node_list += nodes.map(&:id)
    end
    if group_ids
      node_list += groups.flat_map {|g| g.nodes.map(&:id)}
    end
    unless node_list.empty?
      event_scope = event_scope.where(:node_id => node_list)
    end
    if severities
      event_scope = event_scope.where(:severity => severities )
    end
    if states
      event_scope = event_scope.where(:state => states)
    end
    if types
      type_list = types.map {|t| "Event::" + t.camelcase}
      event_scope = event_scope.where(:type => type_list)
    end
    event_scope
  end

  def groups
    Group.where(:id => group_ids)
  end

  def nodes
    Node.where(:id => node_ids)
  end

  def add_group(group)
    id = group.kind_of?(Integer) ? group : group.id
    if group_ids.include?(id)
      false
    else
      group_ids << id
      save!
      true
    end
  end
  def add_node(node)
    id = node.kind_of?(Integer) ? node : node.id
    if node_ids.include?(id)
      false
    else
      node_ids << id
      save!
      true
    end
  end

end
