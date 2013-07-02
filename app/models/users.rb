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
      end
    end       
    #redirect_to(:action=>'index' ) 
  end
  
end



