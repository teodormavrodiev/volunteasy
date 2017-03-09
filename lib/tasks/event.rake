namespace :event do
  desc "send mails to event participants and organizer for every event in the past hour"
  task send_mail_to_past_events: :environment do
    SendMailsForPastEventsJob.perform_now
  end

end
