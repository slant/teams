class Room < ActiveRecord::Base
  has_one :feature_team

  attr_accessible :name, :room_id
  before_create :create_hipchat_room
  validates :name, presence: true

  def create_hipchat_room
    @hipchat = HipChat::API.new(Rails.configuration.app[:hipchat][:token])

    room_name = "[FT] #{self.name}"

    unless ![:development, :test].include?(Rails.env)
      Rails.logger.info "ROOM WAS REALLY CREATED!!! Oh noes!"
      response = @hipchat.rooms_create(room_name, 148845).parsed_response
    else
      Rails.logger.info "ROOM NOT REALLY CREATED"
      response = { 'room' => { 'room_id' => '11111' } }
    end

    if response['room']
      self['name'] = room_name
      self['room_id'] = response['room']['room_id']
    elsif response['error']
      response['error']['message']
    end
  end
end
