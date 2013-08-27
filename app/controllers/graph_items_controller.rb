class GraphItemsController < ResourceController
  self.resource_class = GraphItem

  def create
    item = GraphItem.create!(params[:graph_item])
    redirect_to :back
  end
end
