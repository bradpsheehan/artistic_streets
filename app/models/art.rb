class Art < ActiveRecord::Base
  attr_accessible :artist, :comment, :title, :location_attributes, :image_attributes

  has_one :location
  has_many :images

  validates_associated :location
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :images

  validates :location, presence: true

  def to_map_art
    {
      artist: artist,
      title: title,
      lat: location.latitude,
      long: location.longitude,
      image: images.first.url
    }
  end

end
