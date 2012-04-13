class DevicesController < ApplicationController
  #before_filter :authenticate_user!

  #filter_resource_access

  #filter_access_to :datatable, :require => :read

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

  def datatable
    #json = DevicesDatatable.new(view_context).to_json
    #logger.debug json
    respond_to do |format|
      format.json { render json: DevicesDatatable.new(view_context)}
    end
  end
end
