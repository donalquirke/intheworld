class UserMailer < ActionMailer::Base  
   
  def registration_confirmation(user)
    @user=user
    @url="http://www.moremindfully.com/login"
    # Note: Call to mail needs to be at the end of th method
    mail(:to => user.email, :from => "accounts@moremindfully.com", :subject => "Thank you for registering with MoreMindfully.com")
  end
  
  def registration_notification(user)
    @latest_reg = Registerations.last
    @user=user
    @url="http://www.moremindfully.com/login"
    # Note: Call to mail needs to be at the end of th method
    mail(:to => user.email, :from => "accounts@moremindfully.com", :subject => "New Registration Received")
  end  
  
  def deliver_daily_intention(user,intention)
    @user=user
    @intention=intention
    @url="http://www.moremindfully.com/login"
    Rails.logger.info ("In Deliver Daily Intention: #{@user.first_name} #{@url}, #{@intention.header}")
    # Note: Call to mail needs to be at the end of th method
    mail(:to => user.email, :from => "intentions@moremindfully.com", :subject => "Your mindful intention to practice today.")    
  end
    
end
