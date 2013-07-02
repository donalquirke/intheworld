class Users < ActiveRecord::Base
  has_many :intentions
  has_many :selected_intentions
  
  has_secure_password
  attr_accessible :first_name, :second_name, :password_digest, :email, :password, :password_confirmation, :receive_intentions

  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create  
  
  def self.daily_intention
    @users = Users.find_all_by_receive_intentions (true)
    
    @users.each do |u| 
      @selected_intentions=SelectedIntention.find_all_by_user_id (u.id)
      if @selected_intentions.size > 0 then
        @selected = Array.new
        @selected_intentions.each do |s|
          @selected << Intentions.find_by_id(s.intention_id)
        end
        @random_i = rand(0..(@selected.count-1)) 
        UserMailer.deliver_daily_intention(u,@selected[@random_i]).deliver 
        #Rails.logger.info ("Sent Daily Intention: #{@daily_intention.header} to #{u.email}")
        #Rails.logger.info ("Sent Daily Intention: to #{u.email}")
      else
        # user hasn´t chosen any intentions yet, so randomly give them one
        # !!!!! Really inefficient code. Needs improving.
        @intentions = Intentions.find_all_by_private(false)
        @selected = Array.new
        @intentions.each do |s|
          @selected << s
        end
        @random_i = rand(0..(@intentions.size-1))       
        UserMailer.deliver_daily_intention_nudge(u,@selected[@random_i]).deliver   
        #Rails.logger.info ("Sent a random intention to #{u.email}")               
      end  
    end       
       
    #flash[:notice] = "Daily Intentions were successfully delivered."
    #redirect_to(:action=>'index' ) 
  end
end



