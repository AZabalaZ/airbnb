class AddUbicationAndNameToVehicles < ActiveRecord::Migration[7.1]
  def change
    add_column :vehicles, :name, :string
    add_column :vehicles, :ubication, :string
  end
end
