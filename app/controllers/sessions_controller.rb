class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :create]
  
  def new
    
  end
  
  def create
    user = Users.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      if session[:return_to] == nil
        redirect_to root_url, :notice => "Logged in!"
      else
        url=session[:return_to] 
        session[:return_to] = nil
        redirect_to url
      end
      
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
  end
 
end
