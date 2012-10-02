require 'spec_helper'

describe FeatureTeam do
  it { should have_many(:members).through(:memberships) }
  it { should have_many(:servers).through(:feature_team_servers) }
  it { should have_many(:deploys).through(:repositories) }
end
