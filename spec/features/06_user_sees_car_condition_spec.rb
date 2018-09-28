require 'rails_helper'

feature 'user sees a condiiton of a car', %{
  As a car buyer
  I want to see a condition of the selected car
  So that I can make appropriate purchasing decision
} do

  let!(:honda) { Manufacturer.create(name: "Honda", country: "Japan") }

  let!(:civic_red) { Car.create(
    manufacturer_id: honda.id,
    name: "Civic",
    color: "Red",
    year: 2017,
    mileage: 3500,
    description: "Standard")
  }

  let!(:civic_blue) { Car.create(
    manufacturer_id: honda.id,
    name: "Civic",
    color: "Blue",
    year: 2017,
    mileage: 4500,
    description: "Automatic")
  }

  let!(:civic_white) { Car.create(
    manufacturer_id: honda.id,
    name: "Civic",
    color: "White",
    year: 2017,
    mileage: 8500,
    description: "Automatic")
  }

  let!(:civic_green) { Car.create(
    manufacturer_id: honda.id,
    name: "Civic",
    color: "Green",
    year: 2017,
    mileage: 12500,
    description: "Standard")
  }

  scenario 'user sees conditions of the cars based on the year and mileage' do
    visit root_path

    expect(page).to have_content("Excellent")
    expect(page).to have_content("Good")
    expect(page).to have_content("Fair")
    expect(page).to have_content("Poor")
  end
end
