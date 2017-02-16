class CreateBrews < ActiveRecord::Migration[5.0]
  def change
    create_table :brews do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.decimal :original_gravity, precision: 4, scale: 3
      t.decimal :final_gravity, precision: 4, scale: 3

      t.timestamps
    end
  end
end
