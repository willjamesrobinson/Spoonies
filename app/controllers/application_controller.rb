class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!, only: :home

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :gender, :spoon_type])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :gender, :spoon_type])
  end

  def sing_up_params
    params.require(:user).permit(:first_name, :age, :gender, :spoon_type, :email, :password, :password_confirmation)
  end
end
