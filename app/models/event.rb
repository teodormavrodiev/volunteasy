class Event < ApplicationRecord
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :registrations
  has_many :participants, through: :registrations

  # Photo implementation
  has_attachments :photos, maximum: 2

  validates :organizer_id, presence: true, numericality: true
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :address, presence: true
  validates :capacity, presence: true, numericality: true
  validates :description, presence: true
end

