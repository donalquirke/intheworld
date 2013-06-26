class UsersController < ApplicationController
  def sign_in
  end
  
  def index
    @current_user ||= Users.find(session[:user_id]) if session[:user_id]
    @users=Users.find(:all, :order=>:first_name)
  end
  
  def new
    @new_user=Users.new
    
    respond_to do |format|
      format.html # add_user.html.haml
      format.xml { render :xml => @new_user }
    end
  end

  def show
    @user=Users.find(params[:id])  
    @contributed_public, @contributed_private = Array.new  
    @contributed_public = Intentions.find_all_by_user_id_and_private(@user.id, false) 
    @contributed_private = Intentions.find_all_by_user_id_and_private(@user.id, true) 

    # Rails.logger.info ("Contributed #{@contributed[0].header}")
  end
  
  def edit
    @user=Users.find(params[:id])   
  end
  
  def update
    @user=Users.find(params[:id])
    if @user.update_attributes(
      :first_name=>params[:users][:first_name],
      :second_name=>params[:users][:second_name],
      :password_digest=>params[:users][:password_digest],
      :email=>params[:users][:email],
      :receive_intentions=>params[:users][:receive_intentions])
     # If update succeeds, redirect to the list action
     flash[:notice] = "User updated."
     redirect_to(:action => 'index')
   else
     # If save fails, redisplay the form so user can fix problems
     render('edit')
   end
  end
  
  def destroy
    Users.destroy(params[:id]) 
    redirect_to(:action => 'list_users')
  end
   
  def create
    @new_user=Users.new(params[:users])
    logger.info("#### User Params #{params[:users]}")

    if @new_user.save
        UserMailer.registration_confirmation(@new_user).deliver
        flash[:notice] = "User #{@new_user.first_name} was successfully created."
        redirect_to(:action=>'index' ) 
      else
        render "new"
    end
  end
  
  def daily_intention
    @users = Users.find_all_by_receive_intentions
    
    @users.each do |u| 
      @selected_intentions=SelectedIntention.find_all_by_user_id (u.id)
      @selected = Array.new
      @selected_intentions.each do |s|
        @intention = Intentions.find_by_id(s.intention_id)
        @selected << @intention
    end
        
        # Choose a number in the range 0 to @count
        #@random_i = ????
        #@todays_intention = u.selected_intention[@random_i]     
        #UserMailer.daily_intention(u).deliver      
    end
    
  end
  
  
end
