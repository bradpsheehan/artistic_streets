class ArtsController < ApplicationController

  def index
    @images = Image.all
    @arts = Art.all
    @art = Art.new
    @art.build_location
    @center_point = new_art_or_united_states_center_point
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
      redirect_to arts_path(:new_art => @art.id)
    else
      render 'new'
    end
  end

  def count
    @count = Art.all.count
    render json:{count: @count}
  end

  private

  def should_center_map_on_new_art?
    params[:new_art].present?
  end

  def new_art_or_united_states_center_point
    if should_center_map_on_new_art?
      center_point_of_new_art
    else
      @center_point = { lat: 40.0000, long: -100.0000 }
    end
  end

  def center_point_of_new_art
    new_art = Art.find(params[:new_art])
    {
      lat: new_art.location.latitude,
      long: new_art.location.longitude
    }
  end
end
