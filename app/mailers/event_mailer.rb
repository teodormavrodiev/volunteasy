class EventMailer < ApplicationMailer

  def update(event_id)

    @event = Event.find(event_id)

    @event.participants.each do |par|
      @participant = par
      mail(to: @participant.email, subject: 'Update of ' + @event.name )

    end

  end

  def event_finished_par(event_id)
    #called from a background job, when event is finished
    @event = Event.find(event_id)

    @event.participants.each do |par|

      @par = par

      mail(to: @par.email, subject: 'Thank you for your participation in ' + @event.name )

    end
  end

  def event_finished_org(event_id)
    #called from a background job, when event is finished
    @event = Event.find(event_id)

    @organizer = @event.organizer

    mail(to: @organizer.email, subject: 'Your ' + @event.name + ' event')

  end

end
