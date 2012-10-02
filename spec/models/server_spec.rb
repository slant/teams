require 'spec_helper'

describe Server do

  before :all do
    @server = Server.create( subdomain: 'staging-test' )
  end

  after :all do
    Server.destroy_all
  end

  # Associations
  it { should have_many(:feature_teams).through(:feature_team_servers) }

  # Validations
  it { should validate_presence_of :subdomain }
  it { should validate_uniqueness_of :subdomain }

end
