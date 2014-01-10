class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_signed_in
  around_action :set_secure_token

  def set_signed_in
    @signed_in = read_secure_token.present?
  end

  def read_secure_token
    session[:secret_token]
  end

  def current_user
    @_current_user ||= User.profile
  end

  def redirect_to_login_page_if_not_signed_in
    unless @signed_in
      redirect_to controller: 'users', action: 'login_screen'
    end
  end

  def set_secure_token
    with_secure_token(Claim) do
      with_secure_token(User) do
        yield
      end
    end
  end

  def with_secure_token model_class
    token_header = RackMojAuth::Resources::SECURE_TOKEN.sub('HTTP_','')

    begin
      if token = read_secure_token
        model_class.headers = model_class.headers.merge(token_header => token)
      end
      yield
    ensure
      # ensure token always removed from headers
      if model_class.headers[token_header]
        model_class.headers = model_class.headers.except(token_header)
      end
    end
  end

end
