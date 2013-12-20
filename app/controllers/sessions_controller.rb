class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:new, :create, :get_started]
  
  def get_started
    
  end
  
  def new
    
  end
  
  def create
    
    user = Users.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:return_to] == nil
        redirect_to intentions_url, :notice => "Logged in!"
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
    if session[:naughty]
      flash[:notice] = session[:naughty]
      session[:naughty] = nil
    #else
      #flash[:notice] = "Logged out!"
    end
  end
 
end
