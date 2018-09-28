require 'rails_helper'

feature 'user searches car', %{
  As a car buyer
  I want to search for specific cars
  So that I can look at the cars that I am interested in
} do

  let!(:honda) { Manufacturer.create(name: "Honda", country: "Japan") }
  let!(:vw) { Manufacturer.create(name: "Volkswagen", country: "Germany") }
  let!(:jeep) { Manufacturer.create(name: "Jeep", country: "USA") }

  let!(:civic) { Car.create(
    manufacturer_id: honda.id,
    name: "Civic",
    color: "Red",
    year: 2017,
    mileage: 10000,
    description: "Standard")
  }
  let!(:jetta) { Car.create(
    manufacturer_id: vw.id,
    name: "Jetta",
    color: "Blue",
    year: 2015,
    mileage: 30000,
    description: "Automatic")
  }
  let!(:wrangler) { Car.create(
    manufacturer_id: jeep.id,
    name: "Wrangler",
    color: "Green",
    year: 2007,
    mileage: 100000,
    description: "Standard")
  }

  scenario 'user sees all cars with form submission with no input' do
    visit root_path

    click_button "Search Car"

    expect(page).to have_content(honda.name)
    expect(page).to have_content(civic.name)
    expect(page).to have_content(vw.name)
    expect(page).to have_content(jetta.name)
    expect(page).to have_content(jeep.name)
    expect(page).to have_content(wrangler.name)
  end

  scenario 'user successfully searches car with valid input' do
    visit root_path

    select honda.name, from: 'manufacturer_id'
    select civic.color, from: "color"
    select civic.year, from: "year"
    select "10,000", from: "mileage"

    click_button "Search Car"

    expect(page).not_to have_content(jetta.name)
    expect(page).not_to have_content(wrangler.name)

    expect(page).to have_content(honda.name)
    expect(page).to have_content(civic.name)
    expect(page).to have_content(civic.color)
    expect(page).to have_content(civic.year)
    expect(page).to have_content(civic.mileage)
    expect(page).to have_content(civic.description)
  end
end
