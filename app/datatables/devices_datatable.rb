class DevicesDatatable  
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Device.count,
      iTotalDisplayRecords: devices.total_entries,
      aaData: data
    }
  end

private
  def data
    devices.map do |device|
      [
        link_to(device.hostname, device),
        device.sys_name,
        device.sys_description
      ]
    end
  end

  def method_missing(method, *args, &block)
    @view.send(method, args, block)
  end

  def devices
    @devices ||= fetch_devices
  end

  def fetch_devices
    devices = Device.order("#{sort_column} #{sort_direction}")
    devices = devices.page(page).per_page(per_page)
    if params[:sSearch].present?
      devices = devices.where("hostname like :search", search: "%#{params[:sSearch]}%")
    end
    devices
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page 
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10 
  end

  def sort_column
    columns = %w[hostname sys_name sys_description]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:aSortDir_0] == 'desc' ? 'desc' : 'asc'
  end

end
