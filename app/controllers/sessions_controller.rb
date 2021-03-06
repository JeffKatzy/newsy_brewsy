class SessionsController < ApplicationController
  def create
    user = User.create_or_find(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to users_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end