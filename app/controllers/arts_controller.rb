class ArtsController < ApplicationController

  def index
    @arts ||= Art.all
    @art = Art.new
    @art.build_location
    @art.images.build
    @center_point = new_art_or_united_states_center_point
    @zoom_level = new_art_or_united_states_zoom_level
  end

  def show
    @art = Art.find(params[:id])
    @images = @art.image_urls
    render :json => {:art => @art, :images => @images}
  end

  def create
    @art = Art.new(permit_art_params)
    @art.build_location(permit_art_params[:location_attributes])
    if permit_art_params[:images_attributes].present?
      @art.images.new(permit_art_params[:images_attributes])
    end
    if @art.save
      @art
      flash[:notice] = 'Success! Thank you for contributing!'
      redirect_to arts_path(:new_art => @art.id)
    else
      render 'new'
    end
  end

  def count
    @count = Art.all.count
    render json: {count: @count}
  end

  private

  def permit_art_params
    params.require(:art).permit(:artist,
                                :comment,
                                :title,
                                location_attributes: [:address, :latitude, :longitude],
                                images_attributes: [:image,
                                                    :image_file_name,
                                                    :image_content_type,
                                                    :image_file_size,
                                                    :art_id])
  end

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
      @center_point = {lat: 40.0000, long: -100.0000}
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
