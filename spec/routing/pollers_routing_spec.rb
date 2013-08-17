require "spec_helper"

describe PollersController do
  describe "routing" do

    it "routes to #index" do
      get("/pollers").should route_to("pollers#index")
    end

    it "routes to #new" do
      get("/pollers/new").should route_to("pollers#new")
    end

    it "routes to #show" do
      get("/pollers/1").should route_to("pollers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pollers/1/edit").should route_to("pollers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pollers").should route_to("pollers#create")
    end

    it "routes to #update" do
      put("/pollers/1").should route_to("pollers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pollers/1").should route_to("pollers#destroy", :id => "1")
    end

  end
end
