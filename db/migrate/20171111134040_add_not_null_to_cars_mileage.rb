class AddNotNullToCarsMileage < ActiveRecord::Migration[5.0]
  def change
    change_column :cars, :mileage, :integer, null: false
  end
end
