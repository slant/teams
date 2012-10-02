module MembersHelper
  def list_feature_teams(member)
     if member.feature_teams.any?
       member.feature_teams.collect { |f| link_to f.name, f }.to_sentence.html_safe
     else
      'none'
     end
  end
end
