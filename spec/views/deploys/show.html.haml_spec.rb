require 'spec_helper'

describe "deploys/show" do
  before(:each) do
    @deploy = assign(:deploy, stub_model(Deploy,
      :repository => "Repository",
      :branch => "Branch",
      :sha => "Sha",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Repository/)
    rendered.should match(/Branch/)
    rendered.should match(/Sha/)
    rendered.should match(//)
  end
end
