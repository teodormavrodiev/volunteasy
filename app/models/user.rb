class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, foreign_key: "organizer_id"
  #has_many :events, class_name: "Event", foreign_key: "user_id"

                                                            # IMPORTANT
  has_many :events_as_participant, through: :registrations, source: :event

  # BOOM
  has_many :registrations, foreign_key: "participant_id"

  validates :email, presence: true, format: { with: Devise::email_regexp }
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :phone, presence: true
  # validates :dob, presence: true
end
