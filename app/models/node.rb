class Node < ActiveRecord::Base
  #acts_as_citier
  belongs_to :device
  validates :state, :inclusion => %w(ok warning fail unknown)
  attr_accessible :description, :label, :snmp_index, :state, :type
  has_many :poller_nodes
  has_many :pollers, :through => :poller_nodes
  has_many :dependency_nodes, :class_name => 'Dependency', :foreign_key => :node_id
  has_many :dependencies,  :through => :dependency_nodes

  has_many :dependent_nodes, :class_name => 'Dependency', :foreign_key => :dependency_id
  has_many :dependents, :through => :dependent_nodes, :source => :node
  has_many :data_sources

  def to_s; label; end

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

  def all_dependents
    result = ActiveRecord::Base.connection.execute("SELECT * FROM node_dependents(#{id})")
    Node.where(:id => result.map {|r| r["id"].to_i})
  end

  def all_dependencies
    result = ActiveRecord::Base.connection.execute("SELECT * FROM node_dependencies(#{id})")
    Node.where(:id => result.map {|r| r["id"].to_i})
  end


end
