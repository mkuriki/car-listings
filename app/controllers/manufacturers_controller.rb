class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.order(:name).all
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(m_params)

    if Manufacturer.find_by(name: @manufacturer.name)
      flash[:alert] = "Manufacturer not added - already exists"
      render :new
    else
      if @manufacturer.save
        flash[:notice] = "Manufacturer successfully added"
        redirect_to manufacturers_path
      else
        render :new
      end
    end
  end

  private

  def m_params
    params.require(:manufacturer).permit(
      :name,
      :country
    )
  end
end
