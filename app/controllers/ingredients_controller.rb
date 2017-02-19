class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(
                                  category: params[:category],
                                  ingredient_name: params[:ingredient_name],
                                  weight: params[:weight],
                                  measurement: params[:measurement]
                                  )
    @ingredient.save


    @recipe_ingredient = RecipeIngredient.new(
                                              recipe_id: params[:recipe_id],
                                              ingredient_id: @ingredient.id
                                              )
    @recipe_ingredient.save
     puts "***********************************"
     puts @recipe_ingredient.errors.full_messages
     puts "***********************************"

    flash[:success] = "Added #{@ingredient.weight} #{@ingredient.measurement} of  #{@ingredient.ingredient_name}"
    redirect_back(fallback_location: :new)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = RecipeIngredient.where(recipe_id: @recipe.id)
  end
end
