class AddTempToBrews < ActiveRecord::Migration[5.0]
  def change
    add_column :brews, :temp_data, :text
  end
end
