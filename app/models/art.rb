class Art < ActiveRecord::Base
  attr_accessible :artist, :comment, :title, :location_attributes, :image_attributes, :image

  has_one :location
  has_many :images

  validates_associated :location
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :images

  validates :location, presence: true

  def to_map_art
    puts self.inspect

    {
      artist: artist,
      title: title,
      lat: location.latitude,
      long: location.longitude,
      image: retrieve_first_image
    }
  end

  def retrieve_first_image
    if !images.empty?
      images.first.image.url
    else
      '/images/original/missing.png'
    end
  end

  def self.create_art_with_location_and_image(params)
   art = Art.new( 
                  title: params[:title],
                  artist: params[:artist],
                  comment: params[:comment]
                )
   art.build_location(params[:location_attributes])
   art.images.new(params[:image])
   art.save
   art
  end
end
