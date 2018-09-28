FactoryBot.define do
  factory :manufacturer do
    sequence(:name) { |n| "manufacturer#{n}" }
    country "Japan"
  end
end
