class ApplicationController < ActionController::Base
  # deviseにストロングパラメーターを設定
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
      # deviseのUserモデルにパラメーターを許可
      devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading, :birthday])
  end
end
