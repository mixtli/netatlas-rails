class GraphTemplateItemsController < ResourceController
  self.resource_class = GraphTemplateItem

  def create
    item = GraphTemplateItem.create!(params[:graph_template_item])
    redirect_to :back
  end

  def update
    item = GraphTemplateItem.find(params[:id])
    attrs = params[:graph_template_item].dup
    attrs.delete(:options) if attrs[:options].blank?
    item.update(attrs)
    item.save
    redirect_to :back
  end

  def destroy
    gt = GraphTemplateItem.find(params[:id])
    gt.destroy
    redirect_to :back
  end
end
