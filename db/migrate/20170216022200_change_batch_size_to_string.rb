class ChangeBatchSizeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :recipes, :batch_size, :string
  end
end
