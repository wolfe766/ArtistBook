class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parametrs, if: :devise_controller?
  #setup our additional parameters for our models through
  #sanitization.

  protected 

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:band_name, :genre, :phone, :address, :photo_name])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:band_name, :genre, :phone, :address, :photo_name])
  end

end
