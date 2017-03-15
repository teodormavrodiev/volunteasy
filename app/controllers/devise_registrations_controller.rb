class DeviseRegistrationsController < Devise::RegistrationsController
  before_action :set_photo, only: [:edit]

  def set_photo
    unless resource.has_photo?
      resource.photo_url = 'http://www.oldpotterybarn.co.uk/wp-content/uploads/2015/06/default-medium.png'
    end
  end

  def after_update_path_for(resource)
    user_path(resource)
  end

  def after_sign_up_path_for(resource)
    check_for_event_or_reg(resource)
  end

  def update_resource(resource, params)
    resource.update_without_password(account_update_params)
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :bio, :phone, :dob, :organization, :address, :photo)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :bio, :phone, :dob, :organization, :address, :photo)
  end
end
