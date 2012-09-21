require 'spec_helper'

describe "feature_teams/edit" do
  before(:each) do
    @feature_team = assign(:feature_team, stub_model(FeatureTeam,
      :name => "MyString",
      :slug => "MyString",
      :branch => "MyString",
      :room => nil
    ))
  end

  it "renders the edit feature_team form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feature_teams_path(@feature_team), :method => "post" do
      assert_select "input#feature_team_name", :name => "feature_team[name]"
      assert_select "input#feature_team_slug", :name => "feature_team[slug]"
      assert_select "input#feature_team_branch", :name => "feature_team[branch]"
      assert_select "input#feature_team_room", :name => "feature_team[room]"
    end
  end
end
