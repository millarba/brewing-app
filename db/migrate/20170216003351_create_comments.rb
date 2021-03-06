class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :user_id
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :rating

      t.timestamps
    end
  end
end
