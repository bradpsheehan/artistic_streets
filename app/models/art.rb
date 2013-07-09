class Art < ActiveRecord::Base
  attr_accessible :artist, :comment, :title, :location_attributes

  has_one :location
  validates_associated :location
  accepts_nested_attributes_for :location

  has_many :images

  validates :location, presence: true

  def to_map_art
    {
      artist: artist,
      title: title,
      lat: location.latitude,
      long: location.longitude,
      image: image.url,
    }
  end

end
