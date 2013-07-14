class ImagesController < ApplicationController
  
  def index
    @image = Image.all    
  end

end
