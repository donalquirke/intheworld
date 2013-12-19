class ApplicationController < ActionController::Base
  
  before_filter :authenticate_user!
  
  protect_from_forgery
  force_ssl
  
  
  private

  def current_user
    @current_user ||= Users.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  def authenticate_user!
    if current_user.nil?
      #redirect_to login_url, :alert => "You must first log in to access this page"
      
      # Also store where the users is looking to get to in email link_to scenarios, so we route there post login (if they need to login)
      # For example, if the user has clicked on the daily intention in an email, but they aren't currently logged in
      session[:return_to] = request.fullpath
      #redirect_to login_url
      redirect_to '/get_started'
    end
  end
 
end
