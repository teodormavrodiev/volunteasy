class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:facebook]

  has_many :events, foreign_key: "organizer_id", dependent: :destroy
  has_many :events_as_participant, through: :registrations, source: :event
                                                            # BOOM
  has_many :registrations, foreign_key: "participant_id", dependent: :destroy

  # Images
  has_attachment :photo

  validates :email, presence: true, format: { with: Devise::email_regexp }
  validates :first_name, presence: true
  validates :last_name, presence: true

  after_create :send_welcome_email

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.where(provider: auth.provider, uid: auth.uid).first
    user ||= User.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.photo_url = auth.info.image
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

  def registrations_complete
    self.registrations.where(status: :complete).count
  end

  def has_photo?
    return false unless self.photo
    return true
    #self.photo.path.present?
  end

  def badge
    if registrations_complete == 0
      :newbie
    elsif registrations_complete >= 1 and registrations_complete <= 3
      :regular
    elsif registrations_complete > 3 and registrations_complete < 6
      :advanced
    else
      :expert
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome(self.id).deliver_later
    #UserMailer.welcome(self.id).deliver_later
  end

end
