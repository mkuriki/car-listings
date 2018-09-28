class RemoveConditionFromCars < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :condition
  end
end
