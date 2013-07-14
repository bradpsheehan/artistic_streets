class ArtsController < ApplicationController

  def index
    @art = Art.new
    @art.build_location

    if params[:new_art]
      @art = Art.find(params[:new_art])
      @center_point = {
                        lat: @art.location.latitude,
                        long: @art.location.longitude
                      }
    else
      @center_point = { lat: 42.3583, long: -71.0603 }
    end
    @arts = Art.all
  end

  def show
    @art = Art.find(params[:id])
    @images = @art.image_urls
    render :json => { :art => @art, :images => @images }
  end

  def create
    @art = Art.create_art_with_location_and_image(params[:art])

    if @art.save
      flash.notice = "Thank you for contributing!"
      redirect_to arts_path(new_art: @art.id)
    else
      render 'new'
    end
  end
end
