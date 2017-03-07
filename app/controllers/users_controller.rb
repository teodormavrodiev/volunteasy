class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:view_profile]


  def index
    # list of the event of a user (organizer or participant)
  end

  def show
    # Display the public profile of a specific user
  end
end
