class UsersController < ApplicationController

  def new

  end

  def create
    @user = User.create(
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation]
                      )
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Account Created"
      redirect_to '/'
    else
      flash[:warning] = "Invalid Email or Password"
      redirect_to '/signup'
  end
end
