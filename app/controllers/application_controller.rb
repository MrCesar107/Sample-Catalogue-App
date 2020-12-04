# frozen_string_literal: true

class ApplicationController < ActionController::Base # :nodoc:
  before_action :configure_permitted_params, if: :devise_controller?
  protect_from_forgery with: :exception
  force_ssl if: :ssl_configured?

  def ssl_configured?
    !Rails.env.development?
  end

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
