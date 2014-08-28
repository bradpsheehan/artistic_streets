class LocationsController < ApplicationController

  def index
    @locations = Location.all
    # :address, :latitude, :longitude
  end

  def show
    @location = Location.find(params[:id])
  end

end
