class DevicesController < ApplicationController
  before_filter :authenticate_user!

  filter_resource_access

  def index
    @devices = Device.all
    respond_with(@devices)
  end

  def show
    @device = Device.find(params[:id])
    respond_with(@device)
  end

  def new
    @device = Device.new
    respond_with(@device)
  end

  def edit
    @device = Device.find(params[:id])
  end

  def create
    @device = Device.new(params[:device])
    @device.save
    respond_with(@device)
  end

  def update
    @device = Device.find(params[:id])
    @device.update_attributes(params[:device])
    respond_with(@device)
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    respond_with(@device)
  end
end
