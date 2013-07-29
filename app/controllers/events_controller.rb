class EventsController < ResourceController
  self.resource_class = Event
  respond_to :html, :json
  def index
    logger.debug "in index"
    @q = Event.search(params[:q])
    logger.debug "did search"
    @events = @q.result(:distinct => true).includes(:node).paginate(:per_page => 10, :page => params[:page])
    logger.debug "got result #{@events.count}"
    respond_with(@events) do |format|
      format.html
      format.json { render :json => @events.to_json}
    end
    logger.debug "rendered"
  end
end
