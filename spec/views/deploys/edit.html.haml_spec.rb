require 'spec_helper'

describe "deploys/edit" do
  before(:each) do
    @deploy = assign(:deploy, stub_model(Deploy,
      :repository => "MyString",
      :branch => "MyString",
      :sha => "MyString",
      :user => nil
    ))
  end

  it "renders the edit deploy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => deploys_path(@deploy), :method => "post" do
      assert_select "input#deploy_repository", :name => "deploy[repository]"
      assert_select "input#deploy_branch", :name => "deploy[branch]"
      assert_select "input#deploy_sha", :name => "deploy[sha]"
      assert_select "input#deploy_user", :name => "deploy[user]"
    end
  end
end
