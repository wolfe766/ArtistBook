# CREATED: David Levine 4/7/2018
# MODIFIED: Alec Maier 4/7/2018
#   - added permitted parameters for business
# Description: Main application controller
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #setup our additional parameters for our models through
  #sanitization.

  def after_sign_in_path_for(resource_or_scope)
    if band_signed_in?
      posts_path
    elsif business_signed_in?
      business_path(current_business.id)
    end
  end

  protected 

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:band_name, :genre, :phone, :address, :photo])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:band_name, :genre, :phone, :address, :photo])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:business_name, :phone, :address, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:business_name, :phone, :address, :photo])
  end

end
