class ApplicationController < ActionController::Base
  # deviseでユーザーの名前の登録を許可する
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashbords_home_path
  end

  # deviseでユーザーの名前の登録を許可する
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
