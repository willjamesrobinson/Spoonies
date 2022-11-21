class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :gender, :spoon_type])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :gender, :spoon_type])
  end
end
