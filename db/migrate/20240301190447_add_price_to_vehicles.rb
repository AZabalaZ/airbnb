class AddPriceToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :price, :integer
  end
end
