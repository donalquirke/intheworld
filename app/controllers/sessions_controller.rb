class SessionsController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:create, :get_started, :app_landing]
  
  def get_started   
  end

  
  def menu    
  end
  
  def app_landing
  end
  
  def create
    # Setting the return_to to always be nil. There was a sort of issuse with a testing scenario, if say you try hit a page without being logged in. 
    # You are routed correctly to get_started, but then on the successful log in, routed to where you had tried to invalidly load earlier (and not the men vuew)
    session[:return_to] = nil
    user = Users.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:return_to] == nil
        #redirect_to intentions_url, :notice => "Logged in!"
        redirect_to :action => :menu
      else
        url=session[:return_to] 
        session[:return_to] = nil
        redirect_to url
      end
      
    else
      flash.now.alert = "Invalid email or password"
      redirect_to :action => :app_landing
    end
  end
  
  def destroy
    user = Users.find(session[:user_id])
    @first_name = user.first_name
    session[:user_id] = nil
    session[:return_to] = nil
    if session[:naughty]
      flash[:notice] = session[:naughty]
      session[:naughty] = nil
    #else
      #flash[:notice] = "Logged out!"
    end
  end
 
end
