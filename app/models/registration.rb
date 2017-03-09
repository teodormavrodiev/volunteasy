class Registration < ApplicationRecord
  enum status: [ :missed, :complete]
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  belongs_to :event

  validates :participant_id, presence: true
  validates :event_id, presence: true
end
