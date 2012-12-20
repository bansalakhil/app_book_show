class ApplicationController < ActionController::Base
  
  protect_from_forgery
  
  private  
    def authorize_user
  	  unless (@user = User.find_by_id(session[:user_id]))
        redirect_to login_url, :notice => "Please Log In"
      end
    end

    def authorize_admin
      authorize_user
      if @user
        redirect_to search_url, :notice => "You are not Admin." unless @user.is_admin
      end
    end
end
