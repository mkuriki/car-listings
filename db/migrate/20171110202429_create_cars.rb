class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.integer :manufacturer_id, null: false
      t.string :name, null: false
      t.integer :year, null: false
      t.string :color
      t.integer :mileage
      t.timestamps
    end
  end
end
