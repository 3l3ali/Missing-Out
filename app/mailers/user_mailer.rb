class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user
    @greeting = "Welcome to our platform :)"

    mail(to: @user.email, subject: 'Welcome To Missing Out')
  end
end
