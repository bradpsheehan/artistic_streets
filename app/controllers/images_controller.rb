class ImagesController < ApplicationController

  def index
    @image = Image.all
  end

  def create
    @image = Image.new(image: params[:image], art_id: params["art_id"])
    if @image.save
      redirect_to discover_path, notice: 'Thanks for helping out!'
    else
      redirect_to discover_path, notice: 'Failed to Add Image'
    end
  end

end
