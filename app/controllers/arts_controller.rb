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
  end

  def create
    @art = Art.new(params[:art])

    if @art.save
      flash.notice = "Thank you for contributing!"
      redirect_to arts_path(new_art: @art.id)
    else
      render 'new'
    end
  end

  # def instagram_art
  #   raise params.inspect
  #   # get object id from the request and the time from the request
  #   # request from the instagram api for the object id and since this time
  #   # store new images
  # end

  # def verify_instagram_art
  #   puts params
  #   render text: params[:'hub.challenge']
  # end

end
