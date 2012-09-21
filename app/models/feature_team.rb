class FeatureTeam < ActiveRecord::Base
  belongs_to :room
  attr_accessible :branch, :name, :slug
end
