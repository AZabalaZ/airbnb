# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Vehicle.create!(make: "Toyota", model: "Corolla", year: 2015, color: "Red", mileage: 50000, user: User.first, description: "Great car, very reliable")
Vehicle.create!(make: "Honda", model: "Civic", year: 2016, color: "Blue", mileage: 40000, user: User.first, description: "Great car, very reliable")
Vehicle.create!(make: "Ford", model: "Fusion", year: 2017, color: "Black", mileage: 30000, user: User.first, description: "Great car, very reliable")
Vehicle.create!(make: "Chevrolet", model: "Malibu", year: 2018, color: "White", mileage: 20000, user: User.first, description: "Great car, very reliable")
