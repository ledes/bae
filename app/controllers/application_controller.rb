class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  #  method to sanitized params for devise user sign up
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :username,
      :gender,
      :phone_number,
      :description,
      :profile_picture
    ]
    devise_parameter_sanitizer.for(:account_update) << [
      :username,
      :gender,
      :phone_number,
      :description,
      :profile_picture
    ]
  end
end
