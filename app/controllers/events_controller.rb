class EventsController < ResourceController
  self.resource_class = Event
  self.datatable_class = EventsDatatable
  respond_to :html, :json
  def index
    @q = Event.search(params[:q])
    @events = @q.result(:distinct => true).includes(:node).paginate(:per_page => 10, :page => params[:page])
    respond_with(@events) do |format|
      format.html
      format.json { render :json => @events.to_json}
    end
  end
end
