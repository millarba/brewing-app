class NotifierMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to YouBrew!")
  end

  def bottle_email(brew)
    @brew = brew
    mail(to: @brew.user.email, subject: "Time to Bottle!")
  end

end
