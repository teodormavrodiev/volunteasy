class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized, only: [:home]

  def home

    unless cookies[:address].present?
      city = request.location.city

      cookies[:address] = {
        :value => city.present? ? city : "Barcelona",
        :expires => 12.hour.from_now
      }
    end

    @event = Event.new
  end

  def login_signup
  end

end
