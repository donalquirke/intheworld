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
    logger.info"here in authenticate #{current_user}"
    if current_user.nil?
      redirect_to login_url, :alert => "You must first log in to access this page"
    end
  end


end
