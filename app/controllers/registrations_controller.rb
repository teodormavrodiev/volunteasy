class RegistrationsController < ApplicationController

  def create
    @registration = Registration.new
    @registration.participant_id = current_user.id
    @event = Event.find(params[:event_id])
    @registration.event_id = @event.id
    authorize @registration
    if @registration.save
      redirect_to @event, notice: 'You are going!'
    else
      redirect_to @event, notice: 'An error has occured!'
    end
  end

  def update
    registration = Registration.find(params[:id])
    registration.update(status: "1")

  end

  def destroy
    @registration = Registration.find(params[:id])
    authorize @registration
    @event = Event.find(params[:event_id])
    @registration.destroy
    redirect_to @event, notice: 'You unregistered successfully.'
  end

end
