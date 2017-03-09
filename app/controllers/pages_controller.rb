class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized, only: [:home]
  after_action :verify_policy_scoped, only: [:home], unless: :skip_pundit?

  def home

    if not cookies[:address].present?
      city = request.location.city

      cookies[:address] = {
        :value => city.present? ? city : "Barcelona",
        :expires => 12.hour.from_now
      }
    end

    @event = Event.new
  end

private

end
