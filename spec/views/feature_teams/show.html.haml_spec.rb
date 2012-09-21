require 'spec_helper'

describe "feature_teams/show" do
  before(:each) do
    @feature_team = assign(:feature_team, stub_model(FeatureTeam,
      :name => "Name",
      :slug => "Slug",
      :branch => "Branch",
      :room => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Slug/)
    rendered.should match(/Branch/)
    rendered.should match(//)
  end
end
