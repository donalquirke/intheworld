class IntentionsController < ApplicationController
  
  def index  
    current_user 
    
    @public=Intentions.find_all_by_private false
    @private=Intentions.find_all_by_user_id_and_private @current_user.id, true unless @current_user == nil
    @selected_intentions=SelectedIntention.find_all_by_user_id current_user.id unless @current_user == nil
    @selected = Array.new
    @selected_intentions.each do |s|
      @intention = Intentions.find_by_id(s.intention_id)
      @selected << @intention
    end
    
    #this is just for debugging purposes
    @tmp_intention = Intentions.first
  end

  def new
    @new_intention=Intentions.new
    
    respond_to do |format|
      format.html # add_user.html.haml
      format.xml { render :xml => @user }
    end
  end
  
  def show
    current_user
    @intention=Intentions.find(params[:id])         
    @selected=SelectedIntention.find_by_user_id_and_intention_id(current_user.id,@intention.id)
    if not verify_ok_show (@intention)
      session[:naughty] = "Grasshopper, grasshopper, grasshopper. That is not how we make progress along the path."
      redirect_to logout_path
    end
  end
  
  def edit
    @intention=Intentions.find(params[:id])   
  end
  
  def update
    @intention=Intentions.find(params[:id])
    if @intention.update_attributes(
      :header=>params[:intentions][:header],
      :details=>params[:intentions][:details],
      :the_why=>params[:intentions][:the_why],
      :note1=>params[:intentions][:note1],
      :note2=>params[:intentions][:note2],
      :note3=>params[:intentions][:note3],
      :private=>params[:intentions][:private]
    )
     # If update succeeds, redirect to the list action
     flash[:notice] = "Intention '#{params[:intentions][:header]}' has been updated."
     redirect_to(:action => 'index')
   else
     # If save fails, redisplay the form so user can fix problems
     render('edit')
   end
  end
  
  def destroy
    Intentions.destroy(params[:id]) 
    redirect_to(:action => 'index')
  end
  
  def create
    current_user
    @new_intention=Intentions.new(params[:intentions])    
    @new_intention.user_id = @current_user.id
    
    respond_to do |format|
      if @new_intention.save
        flash[:notice] = "Intention #{@new_intention.header} was successfully created."
        format.html { redirect_to(:action=>'index' ) }
        format.xml { render :xml => @user, :status => :created,
        :location => @intention }
      else
        render "new"
      end
    end
  end
  
  def chosen
    current_user
    #@intention = Intentions.find_by_id(params[:id])
    #Rails.logger.info ("Here here intention #{@intention.header}")
    @si = SelectedIntention.new
    @si.intention_id = params[:id]
    @si.user_id = current_user.id
    if @si.save
      flash[:notice] = "Intention was successfully chosen to practice."
    else
      flash[:error] = "Something went horribly wrong and we couldn't set the intention to be chosen" 
    end
    
    redirect_to intentions_path
  end
  
  def unchosen
    current_user
    @si = SelectedIntention.find_by_user_id_and_intention_id(current_user.id, params[:id])
    if @si 
      if @si.destroy
        flash[:notice] = "Intention was successfully unselected."
      else
        flash[:error] = "Something went horribly wrong and we couldn't unset the intention."  
      end
    end
    
    redirect_to intentions_path    
  end
  
  private
  
  def verify_ok_show (intention)
    #logger.info("**** in verify current user is: #{current_user.id}, user id is #{intention.user_id}")
    return true if current_user.id == intention.user_id || intention.private == false 
  end 
end