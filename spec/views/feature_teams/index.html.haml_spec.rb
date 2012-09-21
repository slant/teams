require 'spec_helper'

describe "feature_teams/index" do
  before(:each) do
    assign(:feature_teams, [
      stub_model(FeatureTeam,
        :name => "Name",
        :slug => "Slug",
        :branch => "Branch",
        :room => nil
      ),
      stub_model(FeatureTeam,
        :name => "Name",
        :slug => "Slug",
        :branch => "Branch",
        :room => nil
      )
    ])
  end

  it "renders a list of feature_teams" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Branch".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
