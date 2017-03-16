class Event < ApplicationRecord

  TAGS = ['Animals', 'Children', 'Community', 'Technology', 'Crisis Support', 'Education', 'Environment', 'Homeless', 'Health', 'Refugees', 'LGBT', 'Disabled', 'Seniors', 'Sports', 'Women']
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  belongs_to :organizer, class_name: "User", foreign_key: "organizer_id"

  has_many :registrations, dependent: :destroy
  has_many :participants, through: :registrations

  # Photo implementation
  has_attachments :photos, maximum: 6

  validates :organizer_id, presence: true, numericality: true
  validates :name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :address, presence: true
  validates :capacity, presence: true, numericality: true
  validates :description, presence: true
  validates :tags, presence: true

  after_update :send_update_email, if: :start_time_changed? || :finish_time_changed?
  after_update :update_registrations, if: :start_time_changed? || :finish_time_changed?

  scope :today, -> { where('start_time BETWEEN ? AND ?', Time.current.beginning_of_day, Time.current.end_of_day).order(start_time: :asc) }
  scope :tomorrow, -> { where('start_time BETWEEN ? AND ?', Date.tomorrow.beginning_of_day, Date.current.end_of_day).order(start_time: :asc) }
  scope :this_week, -> { where('start_time BETWEEN ? AND ?', 2.days.from_now, Date.today.end_of_week.to_time).order(start_time: :asc) }
  scope :next_week, -> { where('start_time BETWEEN ? AND ?', Date.today.end_of_week.to_time, Date.today.end_of_week.to_time + 6.days).order(start_time: :asc) }
  scope :later, -> { where('start_time > ?', Date.today.end_of_week.to_time + 6.days).order(start_time: :asc) }
  scope :including_tags, ->(tags_list) { where("tags @> ?", "{#{tags_list.join(",")}}") }
  scope :uncomplete, -> {where('capacity > ?', participants.count)}

  def spots_left
    self.capacity - self.participants.count
  end

  def start_day
    start_time.to_date
  end

  private

  def send_update_email
    EventMailer.update(self.id).deliver_now
  end

  def update_registrations
    self.registrations.each do |registration|
      registration.update_sms_time
    end
  end

end

