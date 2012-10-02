class Room < ActiveRecord::Base
  has_one :feature_team

  attr_accessible :name, :room_id
  before_create :create_hipchat_room
  validates :name, presence: true

  def create_hipchat_room
    @hipchat = HipChat::API.new(Rails.configuration.app[:hipchat][:token])

    room_name = "Team: #{self.name}"
    response = @hipchat.rooms_create(room_name, 148845).parsed_response

    Rails.logger.info "~~~~~"
    Rails.logger.info response
    Rails.logger.info "~~~~~"

    if response['room']
      self['name'] = room_name
      self['room_id'] = response['room']['room_id']
    elsif response['error']
      response['error']['message']
    end
  end
end
