class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:view_profile]

  def show
    # Display the public profile of a specific user
  end

end
