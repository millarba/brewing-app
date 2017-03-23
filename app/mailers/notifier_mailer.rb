class NotifierMailer < ApplicationMailer
  default from: ENV["GMAIL_USERNAME"]

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: "Sample Email")
  end

  def bottle_email(brew)
    @brew = brew
    mail(to: @brew.user.email, subject: "Time to Bottle!")
  end

end
