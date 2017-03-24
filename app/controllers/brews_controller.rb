class BrewsController < ApplicationController

  def new
    @brew = Brew.new
    @recipe = Recipe.find(params[:id])
  end

  def create
    if current_user
      @brew = Brew.new(
                        user_id: current_user.id,
                        recipe_id: params[:recipe_id],
                        original_gravity: params[:original_gravity],
                        final_gravity: params[:final_gravity]
                        )
       @brew.save
       NotifierMailer.bottle_email(@brew).deliver_later(wait_until: 1.minute.from_now)
      redirect_to '/user'

      @note = Note.new(
                        brew_id: @brew.id,
                        text: params[:text]
                        )
      @note.save
      
    else
      flash[:warning] = "You must be logged in to record your brew!"
      redirect_to '/login'
    end
  end

  def show
    @brew = Brew.find(params[:id])
  end

  def update
    @brew = Brew.find(params[:id])

    if current_user && current_user.id == @brew.user_id
      @brew.original_gravity = params[:original_gravity]
      @brew.final_gravity = params[:final_gravity]

      @brew.save
      redirect_back(fallback_location: :new)
    else
      flash[:warning] = "You can't edit other peoples' brews!"
      redirect_to '/login'
    end
  end

end
