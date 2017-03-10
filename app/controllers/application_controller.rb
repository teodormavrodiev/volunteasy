class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def after_sign_in_path_for(resource)
    check_for_event_or_reg(resource)
  end

  def check_for_event_or_reg(resource)
    if cookies[:event_id] && cookies[:participant] == "true"
      event = Event.find_by(id:cookies[:event_id])
      registration = event.registrations.find_by(participant_id:0)
      registration.participant_id = resource.id if registration
      cookies[:participant] = "nil"
      if registration.save
        user_events_path
      else
        user_path(resource)
      end
    elsif cookies[:event_id] && cookies[:participant] == "false"
      event = Event.find_by(id:cookies[:event_id])
      event.organizer_id = resource.id if event
      cookies[:participant] = "nil"
      if event.save
        user_events_path
      else
        user_path(resource)
      end
    else
      user_path(resource)
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

end
