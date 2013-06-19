class RegisterationsController < ApplicationController
  
  skip_before_filter :authenticate_user!, :only => [:new, :create]
  
  
  def new
    @new_reg=Registerations.new
    
    respond_to do |format|
      format.html # add_user.html.haml
      format.xml { render :xml => @new_reg }
    end
  end
  
  
  def create
    @new_reg=Registerations.new(params[:registerations])
    if @new_reg.save
        @admin_user = Users.find_by_email("donal.quirke@gmail.com")
        UserMailer.registration_notification(@admin_user).deliver
        UserMailer.registration_confirmation(@new_reg).deliver
        flash[:notice] = "User #{@new_reg.email} was successfully registered. We'll email you more details."
        #redirect_to(:action=>'index' ) 
      else
        render "new"
    end
  end
    
end
