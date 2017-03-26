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
    if @user.save
      NotifierMailer.sample_email(@user).deliver_now
      session[:user_id] = @user.id
      flash[:success] = "Account Created"
      redirect_to '/user'
    else
      flash[:warning] = "Invalid Email or Password"
      redirect_to '/signup'
    end
    p @user.errors.full_messages
  end
  
    def show
      @starter_recipes = [Recipe.find(1), Recipe.find(3), Recipe.find(8)]
      @recipes = Recipe.where(user_id: current_user.id)
      @brews = Brew.where(user_id: current_user.id)
    end

end
