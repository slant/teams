require 'spec_helper'

describe "servers/index" do
  before(:each) do
    assign(:servers, [
      stub_model(Server,
        :hostname => "Hostname"
      ),
      stub_model(Server,
        :hostname => "Hostname"
      )
    ])
  end

  it "renders a list of servers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hostname".to_s, :count => 2
  end
end
