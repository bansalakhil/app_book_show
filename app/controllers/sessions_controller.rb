class SessionsController < ApplicationController
  
  def new
    if session[:user_id]
      redirect_to search_url, :notice => "Already logged In"
    else
      flash.now[:hide_links] = true
    end
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:admin] = user.is_admin
      redirect_to search_url
    else
      redirect_to login_url, alert: "Invalid user_name or password"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged Out"
  end

end
