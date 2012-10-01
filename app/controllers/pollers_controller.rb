class PollersController < ResourceController
  self.resource_class = Poller

  def index
    conditions = params.dup
    if conditions[:poller_id]
      conditions[:data_streams_poller_id_eq] = conditions.delete(:poller_id)
    end
    super(conditions)
  end
end
