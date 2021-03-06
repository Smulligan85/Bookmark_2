class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def bookmark_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Bookmark Notification')
  end
end
