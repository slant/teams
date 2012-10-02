require 'spec_helper'

describe "deploys/index" do
  before(:each) do
    assign(:deploys, [
      stub_model(Deploy,
        :repository => "Repository",
        :branch => "Branch",
        :sha => "Sha",
        :user => nil
      ),
      stub_model(Deploy,
        :repository => "Repository",
        :branch => "Branch",
        :sha => "Sha",
        :user => nil
      )
    ])
  end

  it "renders a list of deploys" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Repository".to_s, :count => 2
    assert_select "tr>td", :text => "Branch".to_s, :count => 2
    assert_select "tr>td", :text => "Sha".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
