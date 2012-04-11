class NodesController < ApplicationController
  def index
    @nodes = Node.all
    respond_with(@nodes)
  end

  def show
    @node = Node.find(params[:id])
    respond_with(@node)
  end

  def new
    @node = Node.new
    respond_with(@node)
  end

  def edit
    @node = Node.find(params[:id])
  end

  def create
    @node = Node.new(params[:node])
    @node.save
    respond_with(@node)
  end

  def update
    @node = Node.find(params[:id])
    @node.update_attributes(params[:node])
    respond_with(@node)
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy
    respond_with(@node)
  end
end
