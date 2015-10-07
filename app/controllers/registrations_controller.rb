class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    list = [:username,
            :city,
            :email,
            :password,
            :password_confirmation,
            :admin
           ]
    params.require(:user).permit(list)
  end

  def account_update_params
    list = [:username,
            :city,
            :email,
            :password,
            :password_confirmation,
            :current_password,
            :admin
           ]
    params.require(:user).permit(list)
  end
end
