class RenameMakeOfVehicles < ActiveRecord::Migration[7.1]
  def change
    rename_column :vehicles, :make, :brand
  end
end
