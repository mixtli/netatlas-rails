class DevicesController < NodesController
  filter_access_to :datatable, :require => :read
  self.resource_class = Device

  def show
    @device = DeviceDecorator.find(params[:id])
    respond_with(@device)
  end


  def create
    @device = Device.new(params[:device])
    @device.save
    unless @device.new_record?
      @device.scan
    end
    respond_with(@device)
  end

  def datatable
    respond_to do |format|
      format.json { render json: DevicesDatatable.new(view_context)}
    end
  end
end
