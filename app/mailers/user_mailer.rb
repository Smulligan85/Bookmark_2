class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def bookmark_email(user)
    @user = user
    @url  = 'https://secret-inlet-3534.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bookmark Notification')
  end
end
end
