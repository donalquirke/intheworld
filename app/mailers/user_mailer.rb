class UserMailer < ActionMailer::Base
  
  default :from => "accounts@moremindfully.com"   
   
  def registration_confirmation(user)
    @user=user
    @url="http://www.moremindfully.com/login"
    # Note: Call to mail needs to be at the end of th method
    mail(:to => user.email, :subject => "Thank you for registering with MoreMindfully.com")
  end
  
  def registration_notification(user)
    @latest_reg = Registerations.last
    @user=user
    @url="http://www.moremindfully.com/login"
    # Note: Call to mail needs to be at the end of th method
    mail(:to => user.email, :subject => "New Registration Received")
  end  
    
end
