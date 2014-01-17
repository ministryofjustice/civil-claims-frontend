class UsersController < ApplicationController
  def login_screen
    @page_title = 'Property repossession'
    render 'login', :layout => 'application-claims'
  end

  def create_session
    author = Author::Proxy.new(Rails.application.config.auth_client)
    if(author.login(params[:email], params[:password]))
      session[:secret_token] = author.session
    else
      flash[:alert] = "Authentication failed."
    end
    redirect_to controller: 'claims', action: 'landing' 
  end

  def logout
    reset_session
    redirect_to controller: 'users', action: 'login_screen' 
  end
end