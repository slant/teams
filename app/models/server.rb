class Server < ActiveRecord::Base
  has_one :feature_team
  has_many :deploys

  attr_accessible :subdomain, :hostname

  validates :subdomain, presence: true, uniqueness: true

  FeatureTeam.all.collect(&:server_id)

  scope :available, lambda {
    feature_team_server_ids = FeatureTeam.pluck(:server_id)
    feature_team_server_ids.any? ? where(["id NOT IN (?)", feature_team_server_ids]) : all
  }

  def hostname
    [self[:subdomain], Rails.configuration.app[:domain]].join('.')
  end

  def self.next_available
    available.first
  end
end
