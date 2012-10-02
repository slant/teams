class Member < ActiveRecord::Base
  has_many :memberships
  has_many :feature_teams, through: :memberships

  attr_accessible :email, :hipchat_id, :first_name, :middle_name, :last_name

  before_validation :get_hipchat_id

  validates :hipchat_id, presence: true

  default_scope order(:last_name)

  def get_hipchat_id
    unless self[:hipchat_id].present?
      hipchat = HipChat::API.new(Rails.configuration.app[:hipchat][:token])
      user = hipchat.users_show(self.email)

      if user.key?('user') && !user.key?('error')
        hipchat_id = user['user']['user_id']
        self[:hipchat_id] = hipchat_id
      else
        message = user['error']['code'] == 404 ? 'No hipchat user was found with that email address.' : user['error']['message']
        errors.add(:hipchat_id, message)
      end
    end
  end

  def name
    [first_name, middle_name, last_name].compact.join(' ')
  end

  def formatted_name
    "#{last_name}, #{[first_name, middle_name].compact.join(' ')}"
  end
end
