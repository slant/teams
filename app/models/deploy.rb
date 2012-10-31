class Deploy < ActiveRecord::Base
  belongs_to :feature_team
  belongs_to :member
  belongs_to :repository
  belongs_to :server

  attr_accessible :branch, :commit_message, :environment, :sha,
    :feature_team_id, :member_id, :repository_id, :server_id

  validates :branch, presence: true
  validates :environment, presence: true

  scope :recent, lambda { |n=3| order('created_at desc').limit(n) }

  def perform!
    "cd #{Rails.configuration.app[:repositories_path]}/#{repository.name}; git co #{branch}; git pull origin #{branch}; cap #{environment} HOST=#{server.hostname} deploy"
    "Success!"
  end

  def short_sha
    sha ? sha[0...10] : 'No sha provided'
  end

  def github_url
    "https://github.com/Healthagen/itriage3/commit/#{sha}"
  end
end
