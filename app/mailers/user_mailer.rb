class UserMailer < ActionMailer::Base
    
  def registration_confirmation(user)
    @user=user
    @url="http://www.moremindfully.com/login"
    mail(:to => user.email, :subject => "Thank you for registering with MoreMindfully.com", :from => "accounts@moremindfully.com")
  end
  
  def registration_notification(user)
    @latest_reg = Registerations.last
    @user=user
    @url="http://www.moremindfully.com/login"
    mail(:to => user.email, :subject => "New Registration Received", :from => "accounts@moremindfully.com")
  end
end
