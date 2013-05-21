class UserMailer < ActionMailer::Base
  default from: "poojarudrappa@gmail.com"

  def welcome_email(user)
  @user = user
  @url = "<a href="http://localhost:3000/sign_in">http://localhost:3000/sign_in</a>"
  @site_name = "localhost"
  mail(:to => user.email, :subject => "Welcome to my website.")
end

end
