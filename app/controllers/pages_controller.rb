class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :login_signup, :home_search, :home_create]
  skip_after_action :verify_authorized, only: [:home]

  def home
  end

  def login_signup
  end

  def home_search
    unless cookies[:address].present?
      city = request.location.city

      cookies[:address] = {
        :value => city.present? ? city : "Barcelona",
        :expires => 12.hour.from_now
      }
    end

    @event = Event.new
  end

  def home_create
    unless cookies[:address].present?
      city = request.location.city

      cookies[:address] = {
        :value => city.present? ? city : "Barcelona",
        :expires => 12.hour.from_now
      }
    end

    @event = Event.new
  end

end
