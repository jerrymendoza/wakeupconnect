class SessionsController < ApplicationController
  skip_before_action :require_login
  
  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to home_path
  end
  #logout
  def destroy
    session.clear
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end