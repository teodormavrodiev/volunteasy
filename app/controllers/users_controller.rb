class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  skip_after_action :verify_authorized, only: [:show]

  def show
    # Display the public profile of a specific user
    @user = User.find(params[:id])

    @past_events_attended = past_events_attendee(@user)
    @current_events_attended = current_events_attendee(@user)
    @past_events_managed = past_events_manager(@user)
    @current_events_managed = current_events_manager(@user)
  end

  private

  def past_events_manager(user)
    user.events.where("end_time < ?", DateTime.now)
  end

  def current_events_manager(user)
    user.events.where("end_time > ?", DateTime.now)
  end

  def past_events_attendee(user)
    user.events_as_participant.where("end_time < ?", DateTime.now)
  end

  def current_events_attendee(user)
    user.events_as_participant.where("end_time > ?", DateTime.now)
  end

end
