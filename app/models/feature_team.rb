require 'active_support/inflector'

class FeatureTeam < ActiveRecord::Base
  has_many :memberships
  has_many :members, through: :memberships

  has_many :deploys
  has_many :repositories, through: :deploys

  belongs_to :server
  belongs_to :room

  attr_accessible :branch, :name, :slug, :room_id, :server_id

  before_validation :generate_branch
  before_create :create_room, :assign_server
  before_save :update_slug

  validates :name, presence: true, uniqueness: true
  validates :branch, presence: true,
    uniqueness: { message: '' }, on: :save

  def to_param
    "#{id}-#{slug}"
  end

  def generate_branch
    if self[:branch].blank?
      self[:branch] = "feature_" + name.parameterize.underscore if name
    else
      self[:branch] = "feature_" + self[:branch].downcase
    end
  end

  def create_room
    if room = Room.create(name: name)
      self.room = room
    end
  end

  def assign_server
    self[:server_id] = Server.next_available.id
  end

  def update_slug
    self[:slug] = name.parameterize if name
  end
end
