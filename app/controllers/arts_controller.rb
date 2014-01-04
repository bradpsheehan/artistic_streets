class ArtsController < ApplicationController

  def index
    @images = Image.order("created_at DESC")
    @arts = Art.all
    @art = Art.new
    @art.build_location
    @center_point = new_art_or_united_states_center_point
    @zoom_level = new_art_or_united_states_zoom_level
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

  def new_art_present?
    params[:new_art].present?
  end

  def new_art_or_united_states_zoom_level
    if new_art_present?
      new_art_zoom_level
    else
      @zoom_level = united_states_zoom_level
    end
  end

  def new_art_zoom_level
    13
  end

  def united_states_zoom_level
    4
  end

  def new_art_or_united_states_center_point
    if new_art_present?
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
