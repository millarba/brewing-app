class AddNotesToBrew < ActiveRecord::Migration[5.0]
  def change
    add_column :brews, :notes, :string
  end
end
