class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  skip_before_action :authenticate_user!, only: :home


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :gender, :spoon_type, :age])

    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :gender, :spoon_type, :age])
  end
end
