require 'spec_helper'

describe "servers/new" do
  before(:each) do
    assign(:server, stub_model(Server,
      :hostname => "MyString"
    ).as_new_record)
  end

  it "renders new server form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => servers_path, :method => "post" do
      assert_select "input#server_hostname", :name => "server[hostname]"
    end
  end
end
