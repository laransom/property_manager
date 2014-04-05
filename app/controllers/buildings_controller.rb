class BuildingsController < ApplicationController


  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @owners = Owner.all.map { |o| [o.full_name, o.id] }
  end

  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to new_building_path, notice: 'Building was succesfully recorded'
    else
      render :new
    end
  end

  protected
  def building_params
    params.require(:building).permit(:address, :city, :state, :zip_code, :description, :owner_id)
  end

end
