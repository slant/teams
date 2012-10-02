class Membership < ActiveRecord::Base
  belongs_to :feature_team
  belongs_to :member
end
