class Art < ActiveRecord::Base
  has_one :location
  has_many :images

  validates_associated :location
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :images

  validates :location, presence: true

  MISSING_IMAGE_URL = "http://placegoat.com/300/300"

  def to_map_art
    {
      id: id,
      artist: artist,
      title: title,
      comment: comment,
      lat: location.latitude,
      long: location.longitude,
      image: image_urls
    }
  end

  def image_urls
    images = self.images.collect { |image| image.url(:medium) }
    images << MISSING_IMAGE_URL if images.empty?
    images
  end

end
