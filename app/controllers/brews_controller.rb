class BrewsController < ApplicationController

  def new
    @brew = Brew.new
    @recipe = Recipe.find(params[:id])
  end

  def create
    @brew = Brew.new(
                      user_id: current_user.id,
                      recipe_id: params[:recipe_id],
                      notes: params[:notes],
                      original_gravity: params[:original_gravity],
                      final_gravity: params[:final_gravity]
                      )
    @brew.save

    redirect_to '/user'
  end

  def show
    @brew = Brew.find(params[:id])
  end

end
