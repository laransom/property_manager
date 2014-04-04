class BuildingsController < ApplicationController


  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to buildings_path, notice: 'Building was succesfully recorded'
    else
      render :new
    end
  end

  protected
  def building_params
    params.require(:building).permit(:address, :city, :state, :zip_code, :description)
  end

end
