class DevicesController < NodesController
  filter_access_to :datatable, :require => :read

  def index
    @devices = Device.all
    respond_with(@devices)
  end

  def show
    @device = DeviceDecorator.find(params[:id])
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
    unless @device.new_record?
      @device.scan
    end
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
    respond_to do |format|
      format.json { render json: DevicesDatatable.new(view_context)}
    end
  end
end
