require 'active_support/inflector'

class FeatureTeam < ActiveRecord::Base
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships

  has_many :deploys
  has_many :repositories, through: :deploys

  belongs_to :server
  belongs_to :room, dependent: :destroy
  belongs_to :quarterback, class_name: 'Member', foreign_key: 'quarterback_id'

  accepts_nested_attributes_for :members

  attr_accessible :branch, :name, :slug, :room_id, :server_id, :quarterback_id, :members_attributes

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
      self[:branch] = "develop_" + name.parameterize.underscore if name
    else
      self[:branch] = "develop_" + self[:branch].downcase
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
