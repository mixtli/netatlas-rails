class MapController < ApplicationController
  def index
    respond_to  do |format|
      format.json { render :json => build_json}
      format.html
    end
  end

  private
  def build_json
    @index = 0
    json = {
      :nodes => [],
      :links => []
    }
    Node.all.each do |n|
      json[:nodes] << node_to_json(n)
    end
    json[:nodes].each do |n|
      Node.find(n[:id]).dependencies.each do |d|
        didx = json[:nodes].select {|r| r[:id] == d.id}.first[:index]
        json[:links] << { :source => n[:index], :target => didx }
      end
    end
    json
  end

  private
  def node_to_json(node)
    n = {:name => node.label, :id => node.id, :index => @index, :state => node.state, :url => polymorphic_path(node) }
    @index += 1
    n
  end
end
