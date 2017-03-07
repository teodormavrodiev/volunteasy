class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :first_name, :last_name, :phone, :dob, :organization :address, :photo)
  end
end
