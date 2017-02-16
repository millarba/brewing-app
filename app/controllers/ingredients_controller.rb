class IngredientsController < ApplicationController

  def new

  end

  def create

    @ingredient = Ingredient.new(
                                  category: params[:category],
                                  ingredient_name: params[:ingredient_name]
                                  )
    @ingredient.save

    redirect_to request.referer || root_path
  end
end
