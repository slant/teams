class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_counts

  def get_counts
    @member_count = Member.count
    @feature_team_count = FeatureTeam.count
  end
end
