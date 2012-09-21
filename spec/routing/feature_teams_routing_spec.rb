require "spec_helper"

describe FeatureTeamsController do
  describe "routing" do

    it "routes to #index" do
      get("/feature_teams").should route_to("feature_teams#index")
    end

    it "routes to #new" do
      get("/feature_teams/new").should route_to("feature_teams#new")
    end

    it "routes to #show" do
      get("/feature_teams/1").should route_to("feature_teams#show", :id => "1")
    end

    it "routes to #edit" do
      get("/feature_teams/1/edit").should route_to("feature_teams#edit", :id => "1")
    end

    it "routes to #create" do
      post("/feature_teams").should route_to("feature_teams#create")
    end

    it "routes to #update" do
      put("/feature_teams/1").should route_to("feature_teams#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/feature_teams/1").should route_to("feature_teams#destroy", :id => "1")
    end

  end
end
