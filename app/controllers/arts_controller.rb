class ArtsController < ApplicationController

  def index
    @arts = Art.all
  end

  def show
    @art = Art.find(params[:id])
  end

  def new
    @art = Art.new
    @art.build_location
  end

  def create
    @art = Art.new(params[:art])

    if @art.save
      redirect_to arts_path
      # notice: "Thank you for contributing!"
    else
      render 'new'
    end
  end


end
