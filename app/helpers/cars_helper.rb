module CarsHelper
  def manufacturer_option
    Manufacturer.where(id: Car.select(:manufacturer_id).distinct).order(:name).map { |m| [ m.name, m.id ] }
  end

  def color_option
    Car.select(:color).distinct.order(:color).map { |c| [ c.color, c.color ] }
  end

  def year_option
    Car.select(:year).distinct.order(year: :desc).map { |y| [ y.year, y.year ] }
  end

  def mileage_option
    {
      'N/A' => 'N/A' ,
      '1000' => '1000',
      '10,000' => '10000',
      '100,000' => '100000'
    }
  end

  def condition(year, mileage)
    # drop 'cars.condition' column?
    # BUG: need to remove unique constraint on car

    years = Date.today.year - year
    # years can be -1 (2018 model for 2017) and 0 (2017 model for 2017)
    years = 1 if years <= 0
    average = 12000 * years
    third = average / 3

    if mileage < third
      'Excellent'
    elsif mileage < third * 2
      'Good'
    # elsif mileage >= third * 2 && mileage <= average
    elsif mileage <= average
      'Fair'
    else
      'Poor'
    end

  end

end
