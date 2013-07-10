class ArtsController < ApplicationController

  def index
    @art = Art.new
    @art.build_location
    if params[:new_art]
      @art = Art.find(params[:new_art])
      @center_point = { lat: @art.location.latitude, long: @art.location.longitude }
    else
      @center_point = { lat: 42.3583, long: -71.0603 }
    end
    @arts = Art.all
  end

  def show
    @art = Art.includes(:location).find(params[:id])
    @location = @art.location
  end

  def new
    @art = Art.new
    @art.build_location
    @art.images.new
  end

  def create
    @art = Art.create_art_with_location_and_image(params[:art])
    # @art = Art.new(params[:art])

    #this might become if @art (true/object vs. false)
    if @art.save
      flash.notice = "Thank you for contributing!"
      redirect_to arts_path(new_art: @art.id)
    else
      render 'new'
    end
  end
end
