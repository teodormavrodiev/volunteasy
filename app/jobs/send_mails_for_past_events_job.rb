class SendMailsForPastEventsJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    @events = Event.all.where('end_time BETWEEN ? AND ?', DateTime.now - 1.hour, DateTime.now)
    @events.each do |event|
      EventMailer.event_finished_par(event.id).deliver_later
      EventMailer.event_finished_org(event.id).deliver_later
    end
  end
end
