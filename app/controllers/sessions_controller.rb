class SessionsController < ApplicationController
  def create
    user = User.find_by(id: current_user.id)
    t_user = user.find_or_create_from_auth(request.env['omniauth.auth'], user.id)
    
    session[:user_id] = t_user.uid
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
  
