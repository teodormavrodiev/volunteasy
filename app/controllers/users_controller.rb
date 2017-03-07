class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:view_profile]
  def user_params
    params.require(:user).permit(:name, :email, :first_name, :last_name, :phone, :dob, :organization :address, :photo)
  end

  def show

  end
end
