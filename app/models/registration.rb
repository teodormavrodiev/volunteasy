require 'twilio-ruby'

class Registration < ApplicationRecord
  enum status: [ :incomplete, :complete]
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  belongs_to :event

  validates :participant_id, presence: true
  validates :event_id, presence: true
  validates_uniqueness_of :participant_id, :scope => :event_id, unless: "participant_id==0"

  after_create :send_sms

  scope :not_attended, -> { where(status: 0) }

  @@REMINDER_TIME = 120.minutes # minutes before appointment

  # Notify our appointment attendee 2 hours before the appointment time
  def reminder
    puts "Creating Message"
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    time_str = ((self.event.start_time).localtime).strftime("%I:%M%p on %b. %d, %Y")
    reminder = "Hi #{self.participant.first_name}! This is a reminder to let you know that #{self.event.name} starts at #{time_str}. We hope you have a great time! - Team Volunteasy"
    message = @client.account.messages.create(
      from: @twilio_number,
      to: '0035988891133344',
      body: reminder,
    )
    puts message.to
  end

  def send_sms
    SendEventSmsJob.set(wait_until: time_to_run).perform_later(self.id)
  end

  def time_to_run
    self.event.start_time - @@REMINDER_TIME
  end

  def update_sms_time
    jobs = Sidekiq::ScheduledSet.new.to_a

    jobs.each do |job|
      job_hash = JSON.parse(job.value)

      data = job_hash['args'][0]
      if data['job_class'] == 'SendEventSmsJob' and data['arguments'][0] == self.id
        job.delete
      end
    end

    self.send_sms
  end
end
