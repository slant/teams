module FeatureTeamsHelper
  def member_count(feature_team)
    names = feature_team.members.collect(&:name).to_sentence
    content_tag(:abbr, feature_team.members.count, title: names)
  end
end
