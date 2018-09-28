class Car < ApplicationRecord
  belongs_to :manufacturer

  validates :name, presence: true
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1920, less_than_or_equal_to: Date.current.year + 1 }
  validates :mileage, presence: true, numericality: { only_integer: true }
  validates :color, presence: true

  def self.search(params)
    s = where('')
    params.each do |field, val|
      if val.present?
        case field
        when 'color'
          s = s.where(["#{field} ilike ?", "%#{val}%"])
        when 'year'
          s = s.where(year: val.to_i)
        when 'mileage'
          if val != 'N/A'
            s = s.where(mileage: (0 .. val.to_i))
          end
        when 'manufacturer_id'
          s = s.where(manufacturer_id: val)
        end
      end
    end
    s = s.order(name: :desc)
  end

  # def self.condition(year, mileage)
  #   # drop 'cars.condition' column?
  #   # years might return -1 (2018 model for 2017) and 0 (2017 model for 2017)
  #
  #   years = Date.today.year - year
  #
  #   average = 12000 * years
  #   third_of_average = average / 3
  #
  #   case mileage
  #   when mileage < third_of_average
  #     'excellent'
  #   when third_of_average <= mileage && mileage < third_of_average * 2
  #     'good'
  #   when mileage <= third_of_average * 2 && mileage < average
  #     'fair'
  #   else
  #     'poor'
  #   end
  # end

end
