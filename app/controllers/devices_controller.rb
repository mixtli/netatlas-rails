class DevicesController < NodesController
  filter_access_to :datatable, :require => :read
  self.resource_class = Device
  self.datatable_class = DevicesDatatable

  def show
    @device = DeviceDecorator.find(params[:id])
    respond_with(@device)
  end


  def create
    logger.debug  "in create"
    params[:device].permit! #.permit(:state, :hostname)
    @device = Device.new(params[:device])
    if @device.valid?
      @device.save
      unless @device.new_record?
        #@device.scan
      end
      redirect_to devices_path
    else
      flash[:alert] = "Invalid Device"
      render :new
    end
  end

end
