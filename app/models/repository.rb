class Repository < ActiveRecord::Base
  has_many :deploys
  has_many :feature_teams, through: :deploys

  attr_accessible :name

  def github_url
    "https://github.com/Healthagen/#{name}"
  end
end
