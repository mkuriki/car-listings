class Manufacturer < ApplicationRecord
  has_many :cars, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
end
