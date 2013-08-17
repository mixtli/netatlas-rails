class DevicesController < NodesController
  filter_access_to :datatable, :require => :read
  self.resource_class = Device

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
        @device.scan
      end
    else
    end
    respond_with(@device)
  end

  def datatable
    respond_to do |format|
      format.json { render json: DevicesDatatable.new(view_context)}
    end
  end
end
