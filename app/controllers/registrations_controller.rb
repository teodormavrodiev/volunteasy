class RegistrationsController < ApplicationController
  before_action :set_event

  def create
    @registration = Registration.new
    @registration.participant_id = current_user.id
    @registration.event_id = @event.id
    authorize @registration
    if @registration.save
      redirect_to @event, notice: 'You are going!'
    else
      redirect_to @event, notice: 'An error has occured!'
    end
  end

  def update
    @registration = Registration.find(params[:id])
    authorize @registration
    @registration.complete!
    redirect_to @event, notice: 'Thanks!'
  end

  def destroy
    @registration = Registration.find(params[:id])
    authorize @registration
    @registration.destroy
    redirect_to @event, notice: 'You unregistered successfully.'
  end

private

def set_event
  @event = Event.find(params[:event_id])
end

end
