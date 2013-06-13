class RegisterationsController < ApplicationController
  def new
    @new_reg=Registerations.new
    
    respond_to do |format|
      format.html # add_user.html.haml
      format.xml { render :xml => @new_reg }
    end
  end
  
  
  def create
    @new_reg=Registerations.new(params[:registerations])
    logger.debug "*** params are#{params[:registerations]}"

    if @new_reg.save
        flash[:notice] = "User #{@new_reg.email} was successfully registered. We'll email you more details."
        #redirect_to(:action=>'index' ) 
      else
        render "new"
    end
  end
end
