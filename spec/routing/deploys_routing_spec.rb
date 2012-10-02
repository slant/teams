require "spec_helper"

describe DeploysController do
  describe "routing" do

    it "routes to #index" do
      get("/deploys").should route_to("deploys#index")
    end

    it "routes to #new" do
      get("/deploys/new").should route_to("deploys#new")
    end

    it "routes to #show" do
      get("/deploys/1").should route_to("deploys#show", :id => "1")
    end

    it "routes to #edit" do
      get("/deploys/1/edit").should route_to("deploys#edit", :id => "1")
    end

    it "routes to #create" do
      post("/deploys").should route_to("deploys#create")
    end

    it "routes to #update" do
      put("/deploys/1").should route_to("deploys#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/deploys/1").should route_to("deploys#destroy", :id => "1")
    end

  end
end
