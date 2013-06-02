class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  belongs_to :art

  geocoded_by :address
  before_save :geocode, :if => :address_changed?
end
