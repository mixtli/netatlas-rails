class PollersController < ApplicationController
  respond_to :html, :json, :xml
  def index
    @pollers = Poller.all
    respond_with(@pollers)
  end

  def show
    @poller = Poller.find(params[:id])
    respond_with(@poller)
  end

  def new
    @poller = Poller.new
    respond_with(@poller)
  end

  def edit
    @poller = Poller.find(params[:id])
  end

  def create
    @poller = Poller.new(params[:poller])
    @poller.save
    respond_with(@poller)
  end

  def update
    @poller = Poller.find(params[:id])
    @poller.update_attributes(params[:poller])
    respond_with(@poller)
  end

  def destroy
    @poller = Poller.find(params[:id])
    @poller.destroy
    respond_with(@poller)
  end
end
