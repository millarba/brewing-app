class RemoveRecipeIdFromNotes < ActiveRecord::Migration[5.0]
  def change
    remove_column :notes, :recipe_id, :integer
    add_column :notes, :brew_id, :integer
  end
end
