class RegistrationsController < ApplicationController
  before_action :set_event
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @registration = Registration.new
    if current_user
      @registration.participant_id = current_user.id
      @registration.event_id = @event.id
      authorize @registration
      if @registration.save
        redirect_to @event, notice: 'You are going!'
      else
        redirect_to @event, notice: 'An error has occured!'
      end
    else
      @registration.participant_id = 0
      @registration.event_id = @event.id
      authorize @registration
      user = User.find(0)
      user = User.create(first_name: "placehold", last_name: "placehold", email: "test@test.com", password: "testtest" ) unless user
      if @registration.save
        cookies[:event_id] = @event.id
        cookies[:participant] = true
        redirect_to new_user_session_path
      else
        redirect_to @event, notice: 'An error has occured!'
      end
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
