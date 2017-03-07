class RegistrationsController < ApplicationController

  def new
    @registration = Registration.new
    @event = Event.find(params[:event_id])

    authorize @registration
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.participant_id = current_user.id
    @event = Event.find(params[:event_id])
    @registration.event_id = @event.id
    authorize @registration
    if @registration.save
      redirect_to @event, notice: 'You are going to #{registration.name}.'
    else
      render :new
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    authorize @registration
    @registration.destroy
    redirect_to registrations_url, notice: 'Registration was successfully destroyed.'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def registration_params
      params.require(:registration).permit(:participant_id, :event_id, :status)
    end
end
