require 'pry'
class ResourceController < ApplicationController
  filter_access_to :datatable, :require => :read
  respond_to :html, :json, :xml
  before_filter :authenticate_user!
  class_attribute :datatable_class
  class_attribute :resource_class

  def self.resource_name
    resource_class.to_s.underscore.to_sym
  end
  def self.default_scope
    @default_scope ||= resource_class
  end
  def self.default_scope=(scope)
    @default_scope = scope
  end

  def index(conditions = nil)
    conditions ||= params.dup
    # convert simple params like poller_id to ransack search params like poller_id_eq
    conditions.keys.each do |k|
      if self.class.resource_class.attribute_names.include?(k)
        conditions["#{k}_eq".to_sym] = conditions.delete(k)
      end
    end
    @resources = self.class.default_scope.search(conditions).result.paginate(:page => params[:page], :per_page => 10)
    instance_variable_set("@#{self.class.resource_name.to_s.pluralize}".to_sym, @resources)
    respond_with(@resources) do |format|
      format.html
      format.json { render :json => @resources.to_json}
    end
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
    @node = resource_class.new(params[self.class.resource_name])
    @node.creator = current_user
    @node.save
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def update
    logger.debug "resource_class = #{resource_class}"
    @node = resource_class.find(params[:id])
    logger.debug "node = #{@node.inspect}"
    logger.debug "params = #{params[self.class.resource_name].inspect}"
    @node.update_attributes(params[self.class.resource_name])
    logger.debug "node now #{@node.inspect}"
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def destroy
    @node = resource_class.find(params[:id])
    @node.destroy
    instance_variable_set("@#{self.class.resource_name.to_s}".to_sym, @node)
    respond_with(@node)
  end

  def datatable
    respond_to do |format|
      logger.debug "datatable_class = #{self.class.datatable_class.to_s}"
      format.json { render json: self.class.datatable_class.new(view_context)}
    end
  end

end
