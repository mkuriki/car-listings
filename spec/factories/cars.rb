FactoryBot.define do
  factory :car do
    manufacturer
    sequence(:name) { |n| "car#{n}" }
    year 2018
    mileage 1000
    color "Red"
  end
end
