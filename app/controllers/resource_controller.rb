require 'pry'
class ResourceController < ApplicationController
  respond_to :html, :json, :xml
  before_filter :authenticate_user!
  class_attribute :resource_class

  def self.resource_name
    resource_class.to_s.underscore.to_sym
  end
  def index(conditions = nil)
    conditions ||= params.dup
    # convert simple params like poller_id to ransack search params like poller_id_eq
    conditions.keys.each do |k|
      if self.class.resource_class.attribute_names.include?(k)
        conditions["#{k}_eq".to_sym] = conditions.delete(k)
      end
    end
    @nodes = self.class.resource_class.search(conditions).result
    instance_variable_set("@#{self.class.resource_name.to_s.pluralize}".to_sym, @nodes)
    respond_with(@nodes)
  end

  def show
    @node = resource_class.find(params[:id])
    logger.debug request.headers
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def new
    @node = resource_class.new
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def edit
    @node = resource_class.find(params[:id])
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
  end

  def create
    puts "resource_name #{self.class.resource_name}"
    @node = resource_class.new(params[self.class.resource_name])
    @node.creator = current_user
    @node.save
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def update
    @node = resource_class.find(params[:id])
    @node.update_attributes(params[self.class.resource_name])
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def destroy
    @node = resource_class.find(params[:id])
    @node.destroy
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end
end
