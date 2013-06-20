class IntentionsController < ApplicationController
  
  def index  
    current_user 
    
    @public=Intentions.find_all_by_private false
    @private=Intentions.find_all_by_user_id_and_private @current_user.id, true unless @current_user == nil
    
  end

  def new
    @new_intention=Intentions.new
    
    respond_to do |format|
      format.html # add_user.html.haml
      format.xml { render :xml => @user }
    end
  end
  
  def show
    @intention=Intentions.find(params[:id])     
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
  
end