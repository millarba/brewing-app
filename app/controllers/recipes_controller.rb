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
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
    @comments = Comment.where(commentable_id: @recipe.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if current_user && current_user.id == @recipe.user_id
      @recipe.name = params[:name]
      @recipe.style = params[:style]
      @recipe.image_url = params[:image_url]
      @recipe.boil_time = params[:boil_time]
      @recipe.batch_size = params[:batch_size]
      @recipe.ibu = params[:ibu]

      @recipe.save

      redirect_to "/recipes/#{params[:id]}"
    else
      flash[:warning] = "You can only edit your own recipes"
      redirect_to "/recipes/#{params[:id]}"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    if current_user && current_user.id == @recipe.user_id
      @recipe.delete

      redirect_to "/"
    else
      flash[:warning] = "You can't delete other people's recipes!"
      redirect_to "/recipes/#{params[:id]}"
    end
  end

  def user_recipes
    @recipes = Recipe.where(user_id: current_user.id)
  end

end
