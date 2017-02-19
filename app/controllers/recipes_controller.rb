class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(
                         user_id: current_user.id,
                         name: params[:name],
                         style: params[:style],
                         image_url: params[:image_url],
                         boil_time: params[:boil_time],
                         batch_size: params[:batch_size],
                         ibu: params[:ibu]
                         )
    
    if @recipe.save
      redirect_to "/recipes/#{@recipe.id}"
    else
      flash[:warning] = "Information missing"
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.where(recipe_id: params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name]
    @recipe.style = params[:style]
    @recipe.image_url = params[:image_url]
    @recipe.boil_time = params[:boil_time]
    @recipe.batch_size = params[:batch_size]
    @recipe.ibu = params[:ibu]

    @recipe.save

    redirect_to "/recipes/#{params[:id]}"
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.delete

    redirect_to "/"
  end

end
