class RegistrationsController < ApplicationController
  before_action :set_event_and_registration, only: [:destroy, :update]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @event = Event.find(params[:event_id])
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
      user = User.find_by(id: 0)
      user = User.create(id: 0, first_name: "placehold", last_name: "placehold", email: "testaa@test.com", password: "testtest" ) unless user
      if @registration.save
        cookies[:event_id] = @event.id
        cookies[:participant] = true
        redirect_to new_user_session_path
      else
        redirect_to @event, notice: 'An error has occured!'
      end
    end
  end

  # Only for changing status of registration to "attended" or vice versa
  def update
    if @registration.incomplete?
      @registration.complete!
    elsif @registration.complete?
      @registration.incomplete!
    end
    redirect_to event_users_path(@event), notice: 'Thanks!'
  end

  def destroy
    @registration.destroy
    redirect_to @event, notice: 'You unregistered successfully.'
  end

  private

  def set_event_and_registration
    @event = Event.find(params[:event_id])
    @registration = Registration.find(params[:id])
    authorize @registration
  end

end
