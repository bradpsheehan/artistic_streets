class ArtsController < ApplicationController

  def index
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
      redirect_to arts_path
    else
      render 'new'
    end
  end


end
