class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :visitor_ip

  before_filter :authenticate if Rails.env.production?


  protected

  def authenticate
    authenticate_or_request_with_http_basic('Administration') do |username, password|
      username == 'visitor' && password == ENV['STAGING']
    end
  end

  def visitor_ip
    unless current_user
      session[:visitor_ip] = request.remote_ip
    end
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :email, :password])
  end
end
