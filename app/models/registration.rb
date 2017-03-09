require 'twilio-ruby'

class Registration < ApplicationRecord
  belongs_to :participant, class_name: 'User', foreign_key: 'participant_id'
  belongs_to :event

  validates :participant_id, presence: true
  validates :event_id, presence: true

  after_create :reminder

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
      to: '652720500',
      body: reminder,
    )
    puts message.to
  end

  def when_to_run
    self.event.start_time - @@REMINDER_TIME
  end

  # handle_asynchronously :reminder, run_at: Proc.new { |i| i.when_to_run }
end
