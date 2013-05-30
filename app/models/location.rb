class Location < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude

  geocoded_by :address
  after_save :geocode, :if => :address_changed?
end
