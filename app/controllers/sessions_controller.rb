class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    if  user && request.env['omniauth.params']['role'] == "1"
      session[:user_id] = user.id
      redirect_to admin_dashboards_path
    elsif user
      session[:user_id] = user.id
      redirect_to organizations_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
