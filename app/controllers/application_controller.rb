class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  include CanCan::ControllerAdditions
  layout :select_layout

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:full_name, :email, :password, :password_confirmation, :avatar)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:full_name, :email, :password, :password_confirmation, :avatar)
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  private
  def select_layout
    if current_user.present?
      "admin_lte_2" unless current_user.normal?
    # else
    #   "has_not_login"
    end
  end
end
