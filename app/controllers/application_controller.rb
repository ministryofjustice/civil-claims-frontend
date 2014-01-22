class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Author::Controller
  
  def flash_alert(message)
    flash[:alert] ||= []
    flash[:alert] << message
  end

  def api_models
    [Claim, User]
  end

  def current_user
    @user_profile = session[:profile] ||= User.profile
  end

  def redirect_to_login_page_if_not_signed_in
    unless signed_in?
      redirect_to controller: 'users', action: 'login_screen'
    end
  end

end
