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
  
  def daily_intention(user)
    @user=user
    @url="http://www.moremindfully.com/login"
    # Note: Call to mail needs to be at the end of th method
    mail(:to => user.email, :from => "intentions@moremindfully.com", :subject => "Todays daily intention")    
  end
    
end
