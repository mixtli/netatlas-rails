class GroupsController < ResourceController
  self.resource_class = Group
  self.datatable_class = GroupsDatatable

  def add_node
    @group = Group.find(params[:group_id])
    @group.nodes << Node.find(params[:node_id])
    @group.save
  end
  def remove_node
    membership = Membership.where(:node_id => params[:node_id], :group_id => params[:group_id]).first
    membership.destroy
    redirect_to :back
  end
end
