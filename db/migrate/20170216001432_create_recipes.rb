class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :style
      t.integer :boil_time
      t.integer :ibu
      t.integer :batch_size
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
