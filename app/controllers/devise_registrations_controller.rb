class DeviseRegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      user_path(resource)
    end

    def after_sign_up_path_for(resource)
      if cookies[:event_id]
        event = Event.find(cookies[:event_id])
        event.organizer_id = resource.id
        event.save
      end
      user_path(resource)
    end

    # def update_resource(resource, params)
      #if you need to customize update method on user
    # end

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :bio, :phone, :dob, :organization, :address, :photo)
    end

    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :bio, :phone, :dob, :organization, :address, :photo)
    end

end
