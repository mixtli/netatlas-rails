class Node < ActiveRecord::Base
  acts_as_citier
  belongs_to :device
  validates :state, :inclusion => %w(ok warning fail unknown)
  attr_accessible :description, :label, :snmp_index, :state, :type
  state_machine :state, :initial => :unknown do
    state :pending
    state :unmonitored
    state :unknown
    state :ok
    state :critical
    state :warning
    state :error

    #after_transition any => any do |node, transition|
    #  node.groups.each do |group|
    #    from_method = transition.from + "_node_count"
    #    to_method = transition.to + "_node_count"
    #    group.decrement_count(from_method)
    #    group.increment_count(to_method)
    #  end
    #end

    event :critical do
      transition any => :critical
    end
    event :unmonitored do
      transition any => :unmonitored
    end
    event :unknown do
      transition any => :unknown
    end
    event :ok do
      transition any => :ok
    end
    event :warning do
      transition any => :warning
    end

  end

    
end
