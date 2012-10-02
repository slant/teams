require 'spec_helper'

describe "servers/edit" do
  before(:each) do
    @server = assign(:server, stub_model(Server,
      :hostname => "MyString"
    ))
  end

  it "renders the edit server form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => servers_path(@server), :method => "post" do
      assert_select "input#server_hostname", :name => "server[hostname]"
    end
  end
end
