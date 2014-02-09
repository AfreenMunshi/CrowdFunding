class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :populate_categories
  protect_from_forgery with: :exception
 

  def populate_categories
  	@categories = Category.all
  end

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:nickname) }
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :bday, :password, :password_confirmation, :email) }
  end
end
