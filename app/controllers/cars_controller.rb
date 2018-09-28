class CarsController < ApplicationController
  helper CarsHelper

  def index
    @cars = Car.search(params)
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(c_params)

    # if Car.find_by(name: @car.name)
    #   flash[:alert] = "Car not added - already exists"
    #   render :new
    # else
      if @car.save
        flash[:notice] = "Car successfully added"
        redirect_to cars_path
      else
        @car.description = ""
        render :new
      end
    # end
  end

  private

  def c_params
    params.require(:car).permit(
      :manufacturer_id,
      :name,
      :color,
      :year,
      :mileage,
      # :condition,
      :description
    )
  end
end
