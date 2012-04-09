class PollersController < ApplicationController
  respond_to :json

  def index
    respond_with Poller.all
  end

  def show
    respond_with Poller.find(params[:id])
  end

  def create
    respond_with Poller.create(params[:poller])
  end

  def update
    respond_with Poller.update(params[:id], params[:entry])
  end

  def destroy
    respond_with Poller.destroy(params[:id])
  end
end
