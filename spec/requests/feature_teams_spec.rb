require 'spec_helper'

describe "FeatureTeams" do
  describe "GET /feature_teams" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get feature_teams_path
      response.status.should be(200)
    end
  end
end
