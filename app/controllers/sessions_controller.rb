class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: :create
  
  def create
    if (user = User.find_or_create_from_auth_hash(auth_hash))
      log_in user
      flash[:success] = "ログインに成功しました"
    end
    redirect_to root_path
  end
   
  def destroy
    log_out
    flash[:success] = "ログアウトしました"
    redirect_to root_path
  end

  private

  def auth_hash
    if not Rails.env.test? 
      request.env['omniauth.auth'] 
    else 
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
    end
  end
end
