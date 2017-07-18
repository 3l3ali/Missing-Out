class LocationsController < ApplicationController
  before_action :set_loction, only: [:edit, :update]

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def updated
    @location.update(location_params)
  end

  private

    def location_params
      params.require(:location).permit(:name, :address)
    end

    def set_location
      @location = Location.find(params[:id])
    end
end
