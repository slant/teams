require 'spec_helper'

describe "deploys/new" do
  before(:each) do
    assign(:deploy, stub_model(Deploy,
      :repository => "MyString",
      :branch => "MyString",
      :sha => "MyString",
      :user => nil
    ).as_new_record)
  end

  it "renders new deploy form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => deploys_path, :method => "post" do
      assert_select "input#deploy_repository", :name => "deploy[repository]"
      assert_select "input#deploy_branch", :name => "deploy[branch]"
      assert_select "input#deploy_sha", :name => "deploy[sha]"
      assert_select "input#deploy_user", :name => "deploy[user]"
    end
  end
end
