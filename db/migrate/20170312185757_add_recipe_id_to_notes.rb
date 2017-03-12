class AddRecipeIdToNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :recipe_id, :integer
  end
end
