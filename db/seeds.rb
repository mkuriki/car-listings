# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  manufacturers = [
    {
      name: "Ford",
      country: "USA"
    }, {
      name: "Honda",
      country: "Japan"
    }, {
      name: "Volkswagen",
      country: "Germany"
    }
  ]

  manufacturers.each do |params|
    name = params[:name]
    manufacturers = Manufacturer.where(name: name).first_or_initialize
    manufacturers.assign_attributes(params)
    manufacturers.save!
  end

  cars = [
    {
      manufacturer_id: Manufacturer.find_by(name: "Ford").id,
      name: "Focus",
      year: 2018,
      color: "Red",
      mileage: 0
    },
    {
      manufacturer_id: Manufacturer.find_by(name: "Honda").id,
      name: "Civic",
      year: 2018,
      color: "Blue",
      mileage: 0
    },
    {
      manufacturer_id: Manufacturer.find_by(name: "Volkswagen").id,
      name: "Jetta",
      year: 2018,
      color: "White",
      mileage: 0
    }
  ]

  Car.delete_all

  cars.each do |params|
    Car.create(params)
  end

end
