class AddUniqueToManufacturersName < ActiveRecord::Migration[5.0]
  def change
    change_column :manufacturers, :name, :string, unique: true
  end
end
