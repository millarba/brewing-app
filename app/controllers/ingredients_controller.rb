class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(
                                  recipe_id: params[:recipe_id],
                                  category: params[:category],
                                  ingredient_name: params[:ingredient_name],
                                  weight: params[:weight],
                                  measurement: params[:measurement]
                                  )
    @ingredient.save

    flash[:success] = "Added #{@ingredient.weight} #{@ingredient.measurement} of  #{@ingredient.ingredient_name}"
    redirect_back(fallback_location: :new)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.where(recipe_id: @recipe.id)
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.delete
    redirect_back(fallback_location: :new)
  end
end
