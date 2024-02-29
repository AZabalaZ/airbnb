class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :color
      t.string :make
      t.string :type
      t.string :model
      t.integer :year
      t.integer :mileage
      t.boolean :take, default: false

      t.timestamps
    end
  end
end
