# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def include_test_data?
  puts ENV['TEST'] == true
  ENV['TEST'] == true
end


# Repositories
puts "Creating repositories"
repositories = Repository.pluck(:name)
%w[
  api-clinical
  api-global-search
  healthnews
  itriage-auth
  itriage-web
  itriage3
  myitriage
].each do |r|
  Repository.create( name: r ) unless repositories.include? r
end


# Servers
puts "Creating servers"
(1..10).each { |i| "feature-#{i}" }.each { |s| Server.create( subdomain: s ) }
servers = Server.pluck(:subdomain)

puts include_test_data?

if include_test_data?
  # Members
  puts "Creating members"
  [
    { first_name: 'DeLynn', last_name: 'Berry', email: 'dberry@itriagehealth.com' },
    { first_name: 'Ryan', middle_name: 'L.', last_name: 'Cross', email: 'rcross@itriagehealth.com' },
    { first_name: 'Mike', last_name: 'Zelem', email: 'mzelem@itriagehealth.com' }
  ].each do |m|
    Member.create(m)
  end

  members = Member.all
  m1 = members[0]
  m2 = members[1]
  m3 = members[2]

  # Feature Teams
  puts "Creating feature teams"
  [
    { name: 'Awesomeness', branch: 'awesome', room_id: 12345, quarterback_id: m1.id },
    { name: 'Beer Fridge', branch: 'beer', room_id: 23456, quarterback_id: m2.id },
    { name: 'Cat Herding', branch: 'cats', room_id: 34567, quarterback_id: m3.id }
  ].each do |f|
    FeatureTeam.create(f)
  end

  puts "Reticulating splines"
  feature_teams = FeatureTeam.all
  ft1 = feature_teams[0]
  ft2 = feature_teams[1]
  ft3 = feature_teams[2]

  puts "Assigning members to feature teams"
  ft1.members << [m1, m2]
  ft2.members << m2
  ft3.members << [m1, m3]

  # Deploys
  puts "Creating deploys"
  [
    {
      branch: ft1.branch,
      environment: 'staging',
      sha: 'ca35134b0df4b26a22f3a0041d71bc6a5c717b4d',
      commit_message: 'Made all the things moar betterer.',
      feature_team_id: ft1.id,
      member_id: ft1.members.first.id,
      repository_id: Repository.first.id,
      server_id: ft1.server.id
    }
  ].each do |d|
    Deploy.create(d)
  end
end
