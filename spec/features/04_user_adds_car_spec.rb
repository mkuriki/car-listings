require 'rails_helper'

feature 'user adds car', %{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  #[] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  #[] Only years from 1920 and above can be specified.
  #[] I can optionally specify a description of the car.
  #[] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  #[] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  #[] Upon successfully creating a car, I am redirected back to the index of cars.

  let!(:manufacturer_1) { FactoryBot.create(:manufacturer) }
  let!(:manufacturer_2) { FactoryBot.create(:manufacturer) }

  scenario 'user successfully adds car with valid input and condition appears' do
    visit new_car_path

    select manufacturer_2.name, from: 'Manufacturer'
    fill_in 'Name', with: 'Camry'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '2015'
    fill_in 'Mileage', with: '1000'
    # added - see below expect_to_have_content 'Excellent', input missing in test?
    # fill_in 'Condition', with: 'Excellent'
    fill_in 'Description', with: 'My very first car'
    click_button 'Create Car'

    expect(page).to have_content('Car successfully added')
    expect(page).to have_content('My very first car')
    # expect(page).to have_content('Excellent')
  end

  scenario 'user enters invalid inputs for car and sees errors' do
    visit new_car_path

    select manufacturer_2.name, from: 'Manufacturer'
    fill_in 'Name', with: 'Camry'
    fill_in 'Color', with: 'Black'
    fill_in 'Year', with: '1919'
    fill_in 'Mileage', with: ''
    fill_in 'Description', with: 'My very first car'
    click_button 'Create Car'

    expect(page).to_not have_content('Car successfully added')
    expect(page).to_not have_content('My very first car')

    expect(page).to have_content('Year must be greater than or equal to 1920')
    expect(page).to have_content('Mileage can\'t be blank')
  end
end
