class AddNotNullToCarsColors < ActiveRecord::Migration[5.0]
  def change
    change_column :cars, :color, :string, null: false
  end
end
