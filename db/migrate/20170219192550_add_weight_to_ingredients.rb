class AddWeightToIngredients < ActiveRecord::Migration[5.0]
  def change

    add_column :ingredients, :weight, :decimal, precision: 4, scale: 2
    remove_column :recipe_ingredients, :weight, :decimal
  end
end
